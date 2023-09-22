require 'psych'

CONFIG = Psych.load_file('config_rpsls.yml')

module Displayable
  private

  def display_welcome_message
    system 'clear'
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_rules
    system 'clear'
    puts CONFIG['rules']
    gets
    system 'clear'
  end

  def display_opponents
    system 'clear'

    difficulty = ['Normal', 'Too easy', 'Easy']
    puts "Choose an opponent (1, 2, or 3):\n\n #  Opponent ---- Difficulty "

    difficulty.zip(Computer::OPPONENTS).map.with_index do |(diff, opponent), i|
      "\n[#{i + 1}] #{opponent} ---- #{diff}"
    end
  end

  def display_opponent_greeting
    greeting = CONFIG['greetings'][computer.name]
    puts greeting
  end

  def display_continue
    puts
    puts "Press [enter] to continue."
    gets
    system 'clear'
  end

  def display_history(choice)
    system 'clear'

    history = Move.history

    if history.any? { |_, v| v.empty? }
      puts '------ No move history ------'
      puts
    else
      puts "------ Move History ------"
      puts

      history[:human].each_with_index do |human, i|
        puts "(you) #{human}   -   #{history[:computer][i]}"
        puts
      end
    end
  end

  def display_round_results
    winner = determine_winner

    display_moves
    puts
    display_winner(winner)
    display_opponent_comment(winner)
    puts
    display_score
    display_continue
  end

  def display_moves
    system 'clear'

    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner(winner)
    message =
      case winner
      when :human    then "#{human.name} won!"
      when :computer then "#{computer.name} won!"
      else                "It's a tie!"
      end

    puts message
  end

  def display_opponent_comment(winner)
    message =
      case winner
      when :human    then CONFIG['lose'][computer.name]
      when :computer then CONFIG['win'][computer.name]
      else                CONFIG['tie'][computer.name]
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

  def prompt_yes_no(prompt_to)
    prompt =
      case prompt_to
      when :view_rules
        "Would you like to learn the rules of the game? Enter [y]es or [n]o."
      when :play_again
        "Want to play again? Enter [y]es or [n]o."
      end

    puts prompt
    gets.chomp.strip.downcase
  end

  def prompt_choice(choice)
    message =
      case choice
      when :move
        "Please choose: [r]ock, [p]aper, [sc]issors, [l]izard, [sp]ock." \
        "\nAlternatively, view move [h]istory."
      when :opponent
        display_opponents
      end

    puts message
    gets.chomp.strip.downcase
  end

  def prompt_invalid(type)
    message =
      case type
      when :choice then "Sorry, invalid choice."
      when :name then "Sorry, please enter a valid name."
      when :yes_no then "Sorry, please enter [y]es or [n]o."
      end

    puts message
  end
end

class Move
  VALUES = CONFIG['choices']

  @@history = {human: [], computer: []}

  def >(other_move)
    VALUES[value]['beats'].include?(other_move.value)
  end

  def self.history
    @@history
  end

  def self.reset_history
    @@history = {human: [], computer: []}
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
    Move.history[:human] << move
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
      break if name =~ /^[a-z]+ {0,1}[a-z]{0,}$/
      prompt_invalid(:name)
    end

    name.split.map(&:capitalize).join(' ')
  end

  def valid_move
    system 'clear'

    choice = nil

    loop do
      choice = prompt_choice(:move)

      if choice =~ /^h|history$/
        display_history(choice)
        next
      end

      choice = find_move(choice)
      break if choice
      prompt_invalid(:choice)
    end

    choice
  end

  def find_move(choice)
    Move::VALUES.select { |_, v| v['inputs'].include?(choice) }.keys.first
  end
end

class Computer < Player
  include Displayable
  include Promptable

  OPPONENTS = ['Spongebob', 'Patrick', 'Squidward']

  def choose
    self.move = Move.new(choices.sample)
    Move.history[:computer] << move
  end

  private

  def set_name
    opponent = (RPSGame.matches_played > 0 ? random_opponent : valid_opponent)

    self.name = opponent
  end

  def random_opponent
    OPPONENTS.sample
  end

  def valid_opponent
    choice = nil

    loop do
      choice = prompt_choice(:opponent)
      break if choice =~ /^[1-3]$/
      prompt_invalid(:choice)
      display_continue
    end

    OPPONENTS[choice.to_i - 1]
  end

  def choices
    case name
    when 'Spongebob' then Move::VALUES.keys
    when 'Patrick'   then ['paper']
    when 'Squidward' then ['rock', 'paper']
    end
  end
end

class RPSGame
  include Displayable
  include Promptable

  @@matches_played = 0

  def play
    welcome_player
    choose_opponent

    loop do
      play_match
      display_congrats
      break unless answer_yes?(:play_again)
      reset_match
    end

    display_goodbye_message
  end

  def self.matches_played
    @@matches_played
  end

  private

  attr_reader :human
  attr_accessor :computer

  WIN_SCORE = 3

  def initialize
    @human = Human.new
    @computer = nil
  end

  def welcome_player
    display_welcome_message
    answer_yes?(:view_rules) ? display_rules : display_continue
  end

  def answer_yes?(prompt_to)
    answer = nil

    loop do
      answer = prompt_yes_no(prompt_to)
      break if answer =~ /^(y|yes|n|no)$/
      prompt_invalid(:yes_no)
    end

    answer =~ /^(y|yes)$/
  end

  def choose_opponent
    self.computer = Computer.new
    display_opponent_greeting
    display_continue
  end

  def play_match
    until game_over?
      human.choose
      computer.choose
      display_round_results
    end

    @@matches_played += 1
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

  def reset_match
    system 'clear'
    human.reset_score
    Move.reset_history
    self.computer = Computer.new
    display_opponent_greeting
    display_continue
  end
end

RPSGame.new.play
