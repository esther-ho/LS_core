require 'psych'

CONFIG = Psych.load_file('config_rpsls.yml')

module Displayable
  private

  def display_welcome_message
    system 'clear'
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_history(choice)
    return if choice !~ /^h|history$/ || Move.history.empty?
    system 'clear'

    puts "------ Move History ------"
    puts

    Move.history.each_slice(2) do |(human, computer)|
      puts "(you) #{human}   -   #{computer}"
      puts
    end
  end

  def display_round_results
    display_moves
    puts
    display_winner
    puts
    display_score
    puts
    puts "Press [enter] to continue."
    gets
  end

  def display_moves
    system 'clear'

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

  def display_score
    puts "#{human.name}'s score: #{human.score}"
    puts "#{computer.name}'s score: #{computer.score}"
  end

  def display_congrats
    winner = determine_grand_winner
    puts "#{winner.name} is the grand winner!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end
end

module Promptable
  private

  def prompt_name
    puts "Hello, what's your name?"
    gets.chomp.strip.downcase
  end

  def prompt_choice(choice)
    message =
      case choice
      when :move
        "Please choose: [r]ock, [p]aper, [sc]issors, [l]izard, [sp]ock." \
        "\nAlternatively, view move [h]istory."
      when :opponent
        "Choose opponent: [1]Spongebob, [2]Patrick, [3]Squidward, or [r]andom."
      end

    puts message
    gets.chomp.strip.downcase
  end

  def prompt_play_again
    puts "Want to play again? Enter [y]es or [n]o."
    gets.chomp.strip.downcase
  end

  def prompt_invalid(type = :choice)
    message =
      case type
      when :choice then puts "Sorry, invalid choice."
      when :name then "Sorry, please enter a valid name."
      when :yes_no then puts "Sorry, please enter [y]es or [n]o."
      end

    puts message
  end
end

class Move
  VALUES = CONFIG['choices']

  @@history = []

  def >(other_move)
    VALUES[value]['beats'].include?(other_move.value)
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
  attr_reader :name, :move, :score

  def update_score
    self.score += 1
  end

  def reset_score
    self.score = 0
  end

  private

  attr_writer :name, :move, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  include Displayable
  include Promptable

  def choose
    self.move = Move.new(valid_move)
  end

  private

  def set_name
    self.name = valid_name
  end

  def valid_name
    system 'clear'
    name = nil

    loop do
      name = prompt_name
      break if name =~ /^[a-z]+ *([a-z]+)*$/
      prompt_invalid(:name)
    end

    name.split.map(&:capitalize).join(' ')
  end

  def valid_move
    system 'clear'

    choice = nil

    loop do
      choice = prompt_choice(:move)
      next if display_history(choice)
      choice = find_move(choice)
      break if choice
      prompt_invalid
    end

    choice
  end

  def find_move(choice)
    Move::VALUES.select { |_, v| v['inputs'].include?(choice) }.keys.first
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

    loop do
      play_match
      display_congrats
      break unless play_again?
      reset_match
    end

    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  OPPONENTS = [Spongebob, Patrick, Squidward]
  WIN_SCORE = 3

  def initialize
    @human = Human.new
    @computer = nil
  end

  def choose_opponent
    self.computer = valid_opponent.new
  end

  def random_opponent
    OPPONENTS.sample
  end

  def valid_opponent
    choice = nil

    loop do
      choice = prompt_choice(:opponent)
      break if choice =~ /^[1-3]|r$/
      prompt_invalid
    end

    choice == 'r' ? random_opponent : OPPONENTS[choice.to_i - 1]
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

  def game_over?
    [human.score, computer.score].any?(WIN_SCORE)
  end

  def determine_grand_winner
    human.score > computer.score ? human : computer
  end

  def play_again?
    answer = nil

    loop do
      answer = prompt_play_again
      break if answer =~ /^(y|yes|n|no)$/
      prompt_invalid(:yes_no)
    end

    answer =~ /^(y|yes)$/
  end

  def play_match
    until game_over?
      human.choose
      computer.choose
      display_round_results
    end
  end

  def reset_match
    human.reset_score
    computer.reset_score
    self.computer = random_opponent.new
  end
end

RPSGame.new.play
