class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = new_deck.shuffle
  end

  def new_deck
    RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  end
end

class Card
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }.freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  protected

  def <=>(other_card)
    value <=> other_card.value
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
