require 'pry'

module Display
  def self.start_game
    system 'clear'
    puts "=> Welcome to Twenty-One!"
    puts "\n=> You will be playing against the dealer."
    puts "=> The goal is to get as close to 21 as possible, without going over."
    puts "=> First one to win 3 rounds is the winner of the match!"
    continue
  end

  def self.prompt(key)
    messages = {
      choices: "\n=> [H]it or [S]tay?",
      play_again: "\n=> Would you like to play again? Enter [y]es or [n]o."
    }

    puts messages[key]
  end

  def self.invalid(key)
    messages = {
      choice: "=> Sorry, that's not a valid choice.",
      yes_no: "=> Sorry, please enter [y]es or [n]o."
    }

    puts messages[key]
  end

  def self.decision(player, choice)
    name = (player.instance_of?(Dealer) ? "Dealer" : "You")
    puts "\n=> #{name} chose to #{choice}!"
  end

  def self.continue
    puts "\n=> Press [enter] to continue."
    gets
  end

  def self.busted(player)
    name = (player.instance_of?(Dealer) ? "Dealer" : "You")
    puts "\n=> #{name} busted!"
  end

  def self.round_winner(key)
    message = {
      player: "=> You win!",
      dealer: "=> Dealer wins!",
      tie: "=> It's a tie!"
    }

    puts message[key]
  end

  def self.scoreboard(player_score, dealer_score)
    puts "\n=> Your score: #{player_score}"
    puts "=> Dealer's score: #{dealer_score}"
  end

  def self.grand_winner(key)
    messages = {
      player: "=> You're the winner of the match!",
      dealer: "=> The dealer is the winner of the match!"
    }

    puts messages[key]
  end

  def self.goodbye
    puts "=> Thank you for playing Twenty-One! Goodbye!"
  end
end

class Participant
  attr_reader :hand, :choice, :score

  def initialize
    reset
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

  def >(other_hand)
    total > other_hand.total
  end

  def win
    self.score += 1
  end

  def new_hand
    @hand = Hand.new
  end

  def reset
    new_hand
    self.score = 0
  end

  private

  attr_writer :choice, :score

  def show_total
    name = (instance_of?(Dealer) ? "Dealer's" : "Your")
    puts "#{name} hand total: #{total}"
  end
end

class Dealer < Participant
  DEALER_MIN = 17

  def initialize
    super
    reset_deck
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

  def new_hand
    super
    reset_deck
  end

  def reset
    super
    reset_deck
  end

  private

  attr_reader :deck

  def hide_total
    puts "#{self.class}'s hand total: ?"
  end

  def reset_deck
    @deck = Deck.new
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
      Display.prompt(:choices)
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
  ROUNDS_TO_WIN = 3

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    @current_player = player
  end

  def start
    Display.start_game

    loop do
      play_match
      display_grand_winner
      break unless play_again?
      reset_match
    end

    Display.goodbye
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

  def play_match
    loop do
      deal_cards
      player_move
      dealer_move unless player.busted?
      display_round_winner
      display_score
      break if game_over?
      Display.continue
      reset_hands
    end
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

  def busted_lose
    if player_turn?
      dealer.win
      :dealer
    else
      player.win
      :player
    end
  end

  def compare_hands
    if dealer > player
      dealer.win
      :dealer
    elsif player > dealer
      player.win
      :player
    else
      :tie
    end
  end

  def round_winner
    if someone_busted?
      busted_lose
    else
      compare_hands
    end
  end

  def display_round_winner
    display_busted if someone_busted?
    Display.round_winner(round_winner)
  end

  def display_score
    Display.scoreboard(player.score, dealer.score)
  end

  def game_over?
    [player.score, dealer.score].any?(ROUNDS_TO_WIN)
  end

  def reset_current_player
    @current_player = player
  end

  def reset_hands
    reset_current_player
    player.new_hand
    dealer.new_hand
  end

  def display_grand_winner
    winner = (player.score == ROUNDS_TO_WIN ? :player : :dealer)

    Display.grand_winner(winner)
  end

  def play_again?
    Display.prompt(:play_again)

    answer = nil
    loop do
      answer = gets.chomp.strip.downcase
      break if answer =~ /^(y|n|yes|no)$/
      Display.invalid(:yes_no)
    end

    answer.match?(/^(y|yes)$/)
  end

  def reset_match
    reset_current_player
    player.reset
    dealer.reset
  end
end

Game.new.start
