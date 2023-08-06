require 'psych'
require 'io/console'

CONFIG = Psych.load_file('config_twentyone.yml')
SUITS = CONFIG['suits']
CARDS = CONFIG['cards']
ACE_SUMS = CONFIG['possible_ace_sums']
PLAYERS = [:dealer, :player]
DEAL_TIMES = 2
MAX_TOTAL = 21
DEALER_MIN = 17
ROUNDS_TO_WIN = 5

def prompt(key, substitution = nil)
  msg = CONFIG['prompts'][key]
  msg = format(msg, substitution) if substitution
  puts msg
end

def initialize_deck
  CARDS.keys.product(SUITS).map { |card| card.join(' ') }.shuffle
end

def initialize_hands
  PLAYERS.each_with_object({}) { |player, hsh| hsh[player] = [] }
end

def initialize_hand_totals
  PLAYERS.each_with_object({}) { |player, hsh| hsh[player] = 0 }
end

def initialize_score
  [*PLAYERS, :tie].each_with_object({}) do |score, hsh|
    hsh[score] = 0
  end
end

def prompt_yes_no(key)
  answer = nil
  prompt key

  loop do
    answer = gets.chomp.strip
    break if answer =~ /^(y|yes|n|no)$/i
    prompt "invalid_#{key}"
  end

  answer
end

def yes?(answer)
  !!(answer =~ /^(y|yes)$/i)
end

def display_rules
  system 'clear'
  prompt 'rules'
  $stdin.getch
end

def display_score(score)
  system 'clear'
  puts CONFIG['scoreboard'] % score.values
end

def display_hands(hands, hand_totals, hide_one: false)
  display = (hide_one ? CONFIG['hidden_hands'] : CONFIG['visible_hands'])
  puts format(display, *visible_hands(hands, hand_totals, hide_one))
end

def visible_hands(hands, hand_totals, hide_one)
  dealer_hand, player_hand = hands.values
  dealer_total, player_total = hand_totals.values

  if hide_one
    dealer_hand = hands[PLAYERS[0]].first
    dealer_total = nil
  end

  [joinor(dealer_hand), dealer_total, joinor(player_hand), player_total]
end

def joinor(hand, delimiter: ', ', word: 'and')
  return hand if !hand.is_a?(Array)

  case hand.size
  when 2 then hand.join(" #{word} ")
  else "#{hand[0..-2].join(delimiter)} #{word} #{hand[-1]}"
  end
end

def add_to_hand!(card, hand)
  hand.push(card)
end

def deal!(deck, hands, hand_totals)
  DEAL_TIMES.times do
    PLAYERS.each do |player|
      card = deck.pop
      add_to_hand!(card, hands[player])
    end
  end

  PLAYERS.each do |player|
    hand_totals[player] = update_total(hands[player])
  end
end

def hit!(deck, hands, hand_totals, player)
  card = deck.pop
  add_to_hand!(card, hands[player])
  hand_totals[player] = update_total(hands[player])
end

def update_total(hand)
  totals = possible_totals(hand)
  valid_totals = totals.select { |total| total < MAX_TOTAL }
  valid_totals.empty? ? totals.min : valid_totals.max
end

def possible_totals(hand)
  card_values = find_card_values(hand)
  return [card_values.sum] unless ace?(card_values)

  aces, other_cards = separate_aces(card_values)
  aces = ACE_SUMS.fetch(aces.size)
  aces.map { |ace| ace + other_cards.sum }
end

def ace?(hand)
  !!hand.include?(CARDS['Ace'])
end

def separate_aces(hand)
  hand.partition { |card| card == CARDS['Ace'] }
end

def find_card_values(hand)
  hand.map { |card| CARDS[card[0..-3]] }
end

def prompt_hit_stay
  answer = nil
  prompt 'hit_stay'

  loop do
    answer = gets.chomp
    break if answer =~ /^(h(it)*|s(tay)*)$/i
    prompt 'invalid_hit_stay'
  end

  answer
end

def player_stay?(answer)
  answer =~ /^s(tay)*$/i
end

def dealer_stay?(hand_total)
  hand_total >= DEALER_MIN
end

def display_hit(player)
  prompt "hit_#{player}"
  prompt 'update_hand'
  sleep 2
end

def display_stay(player, hand_totals)
  prompt "stay_#{player}", hand_totals[player]
  prompt 'update_hand'
  sleep 3
end

def detect_result(hand_totals)
  dealer, player = hand_totals.values

  if dealer > MAX_TOTAL
    :busted_dealer
  elsif player > MAX_TOTAL
    :busted_player
  elsif dealer > player
    :win_dealer
  elsif player > dealer
    :win_player
  else
    :tie
  end
end

def display_result(hand_totals)
  prompt detect_result(hand_totals).to_s
end

def busted?(hand_totals)
  [:busted_dealer, :busted_player].include?(detect_result(hand_totals))
end

def who_won(hand_totals)
  result = detect_result(hand_totals)

  if [:busted_player, :win_dealer].include?(result)
    PLAYERS[0]
  elsif [:busted_dealer, :win_player].include?(result)
    PLAYERS[1]
  end
end

def update_score!(score, winner)
  if winner
    score[winner] += 1
  else
    score[:tie] += 1
  end
end

def match_won?(score)
  score.fetch_values(*PLAYERS).include?(ROUNDS_TO_WIN)
end

def match_winner(score)
  score.key(ROUNDS_TO_WIN)
end

# Main method

system 'clear'
prompt 'welcome'
view_rules = prompt_yes_no 'view_rules'

if yes?(view_rules)
  display_rules
else
  prompt 'start_game'
  sleep 4
end

loop do
  score = initialize_score
  dealer, player = PLAYERS

  until match_won?(score)
    deck = initialize_deck
    hands = initialize_hands
    hand_totals = initialize_hand_totals

    deal!(deck, hands, hand_totals)

    until busted?(hand_totals)
      display_score(score)
      display_hands(hands, hand_totals, hide_one: true)
      prompt 'player_has', hand_totals[player]

      answer = prompt_hit_stay

      if player_stay?(answer)
        display_stay(player, hand_totals)
        break
      end

      display_hit(player)
      hit!(deck, hands, hand_totals, player)
    end

    until busted?(hand_totals)
      display_score(score)
      display_hands(hands, hand_totals, hide_one: false)
      prompt 'dealer_has', hand_totals[dealer]

      if dealer_stay?(hand_totals[dealer])
        display_stay(dealer, hand_totals)
        break
      end

      display_hit(dealer)
      hit!(deck, hands, hand_totals, dealer)
    end

    round_winner = who_won(hand_totals)
    update_score!(score, round_winner)

    display_score(score)
    display_hands(hands, hand_totals, hide_one: false)
    display_result(hand_totals)
    prompt 'next_round' unless match_won?(score)
    sleep 2
  end

  prompt "match_win_#{match_winner(score)}"
  play_again = prompt_yes_no 'play_again'
  break unless yes?(play_again)
end

prompt 'bye'
