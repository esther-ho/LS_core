require 'psych'
require 'pry'

CONFIG = Psych.load_file('config_twentyone.yml')
SUITS = CONFIG['suits']
CARDS = CONFIG['cards']
ACE_SUMS = CONFIG['ace_sums']
PLAYERS = [:dealer, :player]
DEAL_TIMES = 2
MAX_TOTAL = 21
DEALER_MIN = 17

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

def display_hands(hands, hand_totals, hide_one: false)
  display = (hide_one ? CONFIG['hidden_hands'] : CONFIG['visible_hands'])

  system 'clear'
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

def someone_won?(hand_totals)
  [:win_dealer, :win_player].include?(detect_result(hand_totals))
end

def player_has_21?(hand_total)
  hand_total == MAX_TOTAL
end

# Main method

loop do
  deck = initialize_deck
  hands = initialize_hands
  hand_totals = initialize_hand_totals
  dealer, player = PLAYERS

  deal!(deck, hands, hand_totals)

  until busted?(hand_totals)
    display_hands(hands, hand_totals, hide_one: true)

    prompt 'turn_player'
    prompt 'player_has_21' if player_has_21?(hand_totals[player])

    answer = prompt_hit_stay

    if player_stay?(answer)
      prompt 'stay_player', hand_totals[player]
      prompt 'update_hand'
      sleep 2
      break
    end

    prompt 'hit_player'
    prompt 'update_hand'
    sleep 2

    hit!(deck, hands, hand_totals, player)
  end

  until busted?(hand_totals)
    display_hands(hands, hand_totals, hide_one: false)

    prompt 'turn_dealer'

    if dealer_stay?(hand_totals[dealer])
      prompt 'stay_dealer', hand_totals[dealer]
      prompt 'update_hand'
      sleep 3
      break
    end

    prompt 'hit_dealer'
    prompt 'update_hand'
    sleep 2

    hit!(deck, hands, hand_totals, dealer)
  end

  display_hands(hands, hand_totals, hide_one: false)
  display_result(hand_totals)

  answer = prompt_yes_no 'play_again'
  break unless yes?(answer)
end

prompt 'bye'
