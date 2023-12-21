# Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.
# 
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

class Dealer
  # Collaborator: Deck
  # Has:
    # deck
    # hand
  # Can:
    # deal
    # hit
    # stay
    # bust

  def initialize
    @deck = Deck.new
    @hand = []
  end

  def deal
  end

  def hit
  end

  def stay
  end

  def busted?
  end
end

class Player
  # Has:
    # hand
  # Can:
    # hit
    # stay
    # bust

  def initialize
    hand = []
  end

  def hit
  end

  def stay
  end

  def busted?
  end
end

class Deck
  # has cards

  def initialize
    @cards = []
  end
end

class Card
  # has:
    # suit
    # name
    # value

  def initialize(suit, name, value)
    @suit = suit
    @name = name
    @value = value
  end
end

class Game
  # Collaborator: Dealer, Player
  # Has:
    # Dealer
    # Player
  # Can:
    # start game

  def initialize
    @dealer = Dealer.new
    @player = Player.new
  end

  def play
    deal_cards
    show_initial_cards
    player_move
    dealer_move unless player_busted
    compare_hands unless dealer_busted
    display_result
  end
end

