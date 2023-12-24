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

require 'pry'

module Display
  def self.choices
    puts "\n==> [H]it or [S]tay?"
  end

  def self.invalid(key)
    messages = {
      choice: "==> Sorry, that's not a valid choice."
    }

    puts messages[key]
  end

  def self.decision(player, choice)
    name = (player.instance_of?(Dealer) ? "Dealer" : "You")
    puts "\n==> #{name} chose to #{choice}!"
  end

  def self.continue
    puts "==> Press [enter] to continue."
    gets
  end

  def self.busted(player)
    name = (player.instance_of?(Dealer) ? "Dealer" : "You")
    puts "\n==> #{name} busted!"
  end

  def self.round_winner(key)
    message = {
      player: "==> You win!",
      dealer: "==> Dealer wins!",
      tie: "==> It's a tie!"
    }

    puts message[key]
  end
end

class Participant
  attr_reader :hand, :choice

  def initialize
    @hand = Hand.new
  end

  def add_to_hand(card)
    hand << card
  end

  def show_hand
    hand.display
    show_total
  end

  def busted?
    hand.busted?
  end

  def total
    hand.total
  end

  private

  attr_writer :choice

  def show_total
    name = (instance_of?(Dealer) ? "Dealer's" : "Your")
    puts "#{name} hand total: #{total}"
  end
end

class Dealer < Participant
  DEALER_MIN = 17

  def initialize
    super
    @deck = Deck.new
  end

  def deal
    deck.draw
  end

  def hide_hand
    hand.display(hide_one: true)
    hide_total
  end

  def choose_move
    self.choice = (total < DEALER_MIN ? :hit : :stay)
  end

  private

  attr_reader :deck

  def hide_total
    puts "#{self.class}'s hand total: ?"
  end
end

class Player < Participant
  attr_reader :hand, :choice

  def choose_move
    self.choice = valid_choice
  end

  private

  def valid_choice
    choice = nil
    loop do
      Display.choices
      choice = gets.chomp.strip.downcase
      break if choice =~ /^(h|hit|s|stay)$/
      Display.invalid(:choice)
    end

    choice[0] == 'h' ? :hit : :stay
  end
end

class Hand
  BUSTED = 21

  attr_reader :cards

  def initialize
    @cards = []
  end

  def <<(card)
    cards << card
  end

  def total
    sum = cards.map(&:value).sum
    aces = cards.count { |card| card.rank == 'A' }

    while sum > BUSTED && aces > 0
      sum -= 10
      aces -= 1
    end

    sum
  end

  def display(hide_one: false)
    format(hide_one).transpose.each { |line| puts line.join('  ') }
  end

  def busted?
    total > BUSTED
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
  RANK_VALUES = {
    '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
    '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10,
    'Q' => 10, 'K' => 10, 'A' => 11
  }

  attr_reader :cards

  def initialize
    @cards = []
    reset
  end

  def reset
    SUITS.product(RANK_VALUES.to_a).each do |suit, (rank, value)|
      cards << Card.new(suit, rank, value)
    end
  end

  def draw
    cards.delete(cards.sample)
  end
end

class Card
  LAYOUT = {
    edge: ["+-----+"],
    shown_1d: ["|%{rank}    |", "|  %{suit}  |", "|    %{rank}|"],
    shown_2d: ["|%{rank}   |", "|  %{suit}  |", "|   %{rank}|"],
    hidden: ["|#####|", "|#####|", "|#####|"]
  }

  attr_reader :suit, :rank, :value

  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @value = value
  end

  def display(hidden: false)
    layout = (rank.size < 2 ? :shown_1d : :shown_2d)
    shown = LAYOUT[layout].map do |line|
      format(line, { rank: rank, suit: suit })
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
    @current_player = player
  end

  def start
    deal_cards
    player_move
    dealer_move unless player.busted?
    display_round_winner
  end

  private

  attr_reader :dealer, :player, :current_player

  def deal_cards
    DEAL_CARDS.times do
      player.add_to_hand(dealer.deal)
      dealer.add_to_hand(dealer.deal)
    end
  end

  def show_cards
    system 'clear'
    player_turn? ? dealer.hide_hand : dealer.show_hand
    player.show_hand
  end

  def player_turn?
    current_player == player
  end

  def player_move
    current_player_move
  end

  def dealer_move
    @current_player = dealer
    current_player_move
  end

  def current_player_move
    loop do
      show_cards
      current_player.choose_move
      break if current_player.choice == :stay
      current_player_hit
      break if current_player.busted?
    end

    return if current_player.busted?
    Display.decision(current_player, current_player.choice)
    Display.continue
  end

  def current_player_hit
    Display.decision(current_player, current_player.choice)
    Display.continue

    if player_turn?
      player.add_to_hand(dealer.deal)
    else
      dealer.add_to_hand(dealer.deal)
    end

    show_cards
  end

  def someone_busted?
    player.busted? || dealer.busted?
  end

  def display_busted
    Display.busted(current_player)
  end

  def compare_hands
    if player.busted? || dealer.total > player.total
      :dealer
    elsif dealer.busted? || player.total > dealer.total
      :player
    else
      :tie
    end
  end

  def display_round_winner
    display_busted if someone_busted?
    Display.round_winner(compare_hands)
  end
end

Game.new.start
