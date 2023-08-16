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

def display_cards(hands, player)
  cards = format_cards(hands, player, unknown_card: false)

  player_hand = hands[player].map do |card|
    suit = card[-1]
    value = card[0]
    [nil, suit, value, suit, nil]
  end
  player_hand = player_hand.transpose

  cards = cards.map.with_index { |line, i| format(line, *player_hand[i]) }

  prompt "hand_#{player}"
  puts cards
end

def display_one_card(hands, player)
  first_card = hands[player][0]
  suit = first_card[-1]
  value = first_card[0]
  first_card = [nil, suit, value, suit, nil]

  cards = format_cards(hands, player, unknown_card: true)
  cards = cards.map.with_index { |line, i| format(line, first_card[i]) }

  prompt "hand_#{player}"
  puts cards
end

def format_cards(hands, player, unknown_card: false)
  card_count = hands[player].size - 1
  additional_cards = [CONFIG['card_known']] * card_count
  cards = if unknown_card
            CONFIG['card_known'].zip(CONFIG['card_unknown'])
          else
            CONFIG['card_known'].zip(*additional_cards)
          end

  cards.map { |line| line.join(' ') }
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
  card_values = hand.map { |card| CARDS[card[0..-3]] }
  total = card_values.sum
  return total unless card_values.include?(CARDS['Ace'])

  ace_count = card_values.count(CARDS['Ace'])
  ace_count.times do
    break if total <= 21
    total -= 10
  end

  total
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
      display_one_card(hands, dealer)
      display_cards(hands, player)
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
      display_cards(hands, dealer)
      display_cards(hands, player)
      prompt 'dealer_has', hand_totals[dealer]

      if dealer_stay?(hand_totals[dealer])
        display_stay(dealer, hand_totals)
        break
      end

      display_hit(dealer)
      hit!(deck, hands, hand_totals, dealer)
    end

    update_score!(score, who_won(hand_totals))

    display_score(score)
    display_cards(hands, dealer)
    display_cards(hands, player)
    display_result(hand_totals)
    prompt 'next_round' unless match_won?(score)
    sleep 2
  end

  prompt "match_win_#{match_winner(score)}"
  play_again = prompt_yes_no 'play_again'
  break unless yes?(play_again)
end

prompt 'bye'
