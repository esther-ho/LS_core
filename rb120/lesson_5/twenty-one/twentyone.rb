# Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

# Here is an overview of the game:
# Both participants are initially dealt 2 cards from a 52-card deck.
# Player sees 2 cards but sees only one of dealer's cards
# The player takes the first turn, and can "hit" or "stay".
# If the player busts, he loses. If he stays, it's the dealer's turn.
# The dealer must hit until his cards add up to at least 17.
# If he busts, the player wins. If both player and dealer stays, then the highest total wins.
# If both totals are equal, then it's a tie, and nobody wins.

# Consist of dealer and player
# Use 52 card deck
# Participants aim score close to 21 without going over
# First, participants are dealt 2 cards from deck
# Player goes first: hit or stay
# If player busts, player loses
# If player stays, dealers turn
# Dealer hit until cards total at least 17
# If dealer busts, player wins
# If both dealer and player stay, highest total wins
# If equal totals, tie.

class Participant
  def initialize
    @hand = Hand.new
  end

  def add_to_hand(card)
    hand << card
  end

  def show_hand(hide_one: false)
    hand.display(hide_one)
  end
end

class Dealer < Participant
  attr_reader :hand

  def initialize
    super
    @deck = Deck.new
  end

  def deal
    deck.draw
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  private

  attr_reader :deck
end

class Player < Participant
  attr_reader :hand

  def hit
  end

  def stay
  end

  def busted?
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def <<(card)
    cards << card
  end

  def display(hide_one)
    format(hide_one).transpose.each { |line| puts line.join('  ') }
  end

  private

  def format(hide_one)
    if hide_one
      cards.map.with_index do |card, i|
        i == 0 ? card.display(hidden: true) : card.display
      end
    else
      cards.map(&:display)
    end
  end
end

class Deck
  SUITS = ["\u2664", "\u2665", "\u2667", "\u2666"]
  NAMES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]

  attr_reader :cards

  def initialize
    @cards = []
    reset
  end

  def reset
    SUITS.product(NAMES.zip(VALUES)).each do |suit, (name, value)|
      cards << Card.new(suit, name, value)
    end
  end

  def draw
    cards.delete(cards.sample)
  end
end

class Card
  LAYOUT = {
    edge: ["+-----+"],
    shown_1d: ["|%{name}    |", "|  %{suit}  |", "|    %{name}|"],
    shown_2d: ["|%{name}   |", "|  %{suit}  |", "|   %{name}|"],
    hidden: ["|#####|", "|#####|", "|#####|"]
  }

  attr_reader :suit, :name, :value

  def initialize(suit, name, value)
    @suit = suit
    @name = name
    @value = value
  end

  def display(hidden: false)
    layout = (name.size < 2 ? :shown_1d : :shown_2d)
    shown = LAYOUT[layout].map do |line|
      format(line, { name: name, suit: suit })
    end

    if hidden
      LAYOUT[:edge] + LAYOUT[:hidden] + LAYOUT[:edge]
    else
      LAYOUT[:edge] + shown + LAYOUT[:edge]
    end
  end
end

class Game
  DEAL_CARDS = 2

  def initialize
    @dealer = Dealer.new
    @player = Player.new
  end

  def start
    deal_cards
    show_initial_cards
    # player_move
    # dealer_move unless player_busted
    # compare_hands unless dealer_busted
    # display_result
  end

  private

  attr_reader :dealer, :player

  def deal_cards
    DEAL_CARDS.times do
      player.add_to_hand(dealer.deal)
      dealer.add_to_hand(dealer.deal)
    end
  end

  def show_initial_cards
    dealer.show_hand(hide_one: true)
    player.show_hand
  end
end

Game.new.start
