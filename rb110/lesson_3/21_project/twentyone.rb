require 'psych'
require 'pry'

CONFIG = Psych.load_file('config_twentyone.yml')
SUITS = CONFIG['suits']
CARDS = CONFIG['cards']
PLAYERS = [:dealer, :player]

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

deck = initialize_deck
hands = initialize_hands
hand_totals = initialize_hand_totals
dealer, player = PLAYERS

display_hands(hands, hand_totals, hide_one: true)
