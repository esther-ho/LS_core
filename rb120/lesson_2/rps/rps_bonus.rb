require 'psych'

CONFIG = Psych.load_file('config_rpsls.yml')

module Displayable
  private

  def display_welcome_message
    system 'clear'
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end
end

module Promptable
  private

  def prompt_name
    system 'clear'

    name = nil

    loop do
      puts "Hello, what's your name?"
      name = gets.chomp.strip
      break if name =~ /^[a-z]+ *[a-z]+$/i
      puts "Sorry, please enter a valid name."
    end

    name.split.map(&:capitalize).join(' ')
  end

  def prompt_choice
    choice = nil

    loop do
      puts "Please choose [r]ock, [p]aper, [sc]issors, [l]izard, or [sp]ock."
      choice = gets.chomp.strip.downcase
      break if Move.valid?(choice)
      puts "Sorry, invalid choice."
    end

    Move.find(choice)
  end
end

class Move
  VALUES = CONFIG['choices']

  def >(other_move)
    VALUES[value]['beats'].include?(other_move.value)
  end

  def self.valid?(choice)
    valid_values = VALUES.map { |_, v| v.values_at('inputs') }.flatten

    valid_values.include?(choice)
  end

  def self.find(abbreviation)
    VALUES.select { |_, v| v['inputs'].include?(abbreviation) }.keys.first
  end

  protected
  
  attr_reader :value

  private

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end
end

class Player
  def move
    move_history.last
  end

  def update_score
    self.score += 1
  end

  def reset_score
    self.score = 0
  end

  attr_reader :name

  private

  attr_accessor :move_history, :score
  attr_writer :name

  def initialize
    set_name
    @move_history = []
    @score = 0
  end

  def update_moves(move)
    move_history << move
  end
end

class Human < Player
  include Promptable

  def choose
    move = prompt_choice
    update_moves(move)
  end

  private

  def set_name
    self.name = Move.new(prompt_name)
  end
end

class Computer < Player
  private

  def set_name
    self.name = self.class.to_s
  end
end

class Spongebob < Computer
  def choose
    move = Move.new(Move::VALUES.keys.sample)
    update_moves(move)
  end
end

class Patrick < Computer
  def choose
    move = Move.new('paper')
    update_moves(move)
  end
end

class Squidward < Computer
  def choose
    move = Move.new(['rock', 'paper'].sample)
    update_moves(move)
  end
end

class RPSGame
  include Displayable
  include Promptable

  def play
    display_welcome_message
    choose_opponent
    human.choose
    computer.choose
    display_moves
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = nil
  end

  def choose_opponent
    self.computer = Computer.subclasses.sample.new
  end
end

RPSGame.new.play
