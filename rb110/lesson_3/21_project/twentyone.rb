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

def display_result(hand_totals, substitution = nil)
  prompt "#{detect_result(hand_totals)}", substitution
end

# Main method

deck = initialize_deck
hands = initialize_hands
hand_totals = initialize_hand_totals
dealer, player = PLAYERS

deal!(deck, hands, hand_totals)
display_hands(hands, hand_totals, hide_one: true)

answer = prompt_hit_stay

hit!(deck, hands, hand_totals, player) unless player_stay?(answer)
display_hands(hands, hand_totals, hide_one: true)

display_hands(hands, hand_totals, hide_one: false)
hit!(deck, hands, hand_totals, dealer) unless dealer_stay?(hand_totals[dealer])
display_hands(hands, hand_totals, hide_one: false)

display_result(hand_totals)
