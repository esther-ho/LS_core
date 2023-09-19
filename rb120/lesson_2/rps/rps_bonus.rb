require 'psych'

CONFIG = Psych.load_file('config_rpsls.yml')

module Displayable
  private

  def display_welcome_message
    system 'clear'
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_history
    system 'clear'

    puts "------ Move History ------"

    Move.history.each_slice(2) do |(human, computer)|
      puts "(you) #{human}   -   #{computer}"
    end
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    winner = determine_winner

    message = 
      case winner
      when :human    then "#{human.name} won!"
      when :computer then "#{computer.name} won!"
      else                "It's a tie!"
      end
      
    puts message
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
      break if name =~ /^[a-z]+ *([a-z]+)*$/i
      puts "Sorry, please enter a valid name."
    end

    name.split.map(&:capitalize).join(' ')
  end

  def prompt_choice
    choice = nil

    loop do
      puts "Please choose [r]ock, [p]aper, [sc]issors, [l]izard, [sp]ock, or [h]istory."
      choice = gets.chomp.strip.downcase

      if choice == 'h' && !Move.history.empty?
        display_history
        puts
        next
      end

      break if Move.valid?(choice)
      puts "Sorry, invalid choice."
    end

    Move.find(choice)
  end
end

class Move
  VALUES = CONFIG['choices']
  
  @@history = []

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

  def self.history
    @@history
  end

  protected
  
  attr_reader :value

  private

  def initialize(value)
    @value = value
    @@history << value.capitalize
  end

  def to_s
    value
  end
end

class Player
  attr_reader :name, :move

  def update_score
    self.score += 1
  end

  def reset_score
    self.score = 0
  end

  private

  attr_accessor :score
  attr_writer :name, :move

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  include Displayable
  include Promptable

  def choose
    self.move = Move.new(prompt_choice)
  end

  private

  def set_name
    self.name = prompt_name
  end
end

class Computer < Player
  def choose
    self.move = Move.new(choices.sample)
  end

  private

  def set_name
    self.name = self.class.to_s
  end
end

class Spongebob < Computer
  private

  def choices
    Move::VALUES.keys
  end
end

class Patrick < Computer
  private

  def choices
    ['paper']
  end
end

class Squidward < Computer
  private

  def choices
    ['rock', 'paper']
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
    display_winner
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

  def determine_winner
    if human.move > computer.move
      human.update_score
      :human
    elsif computer.move > human.move
      computer.update_score
      :computer
    else
      :tie
    end
  end
end

RPSGame.new.play
