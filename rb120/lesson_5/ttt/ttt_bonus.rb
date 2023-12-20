require 'psych'
require 'pry'

CONFIG = Psych.load_file('config_ttt.yml')

module Displayable
  def self.welcome
    puts "=> Welcome to Tic Tac Toe!\n"
  end

  def self.prompt(key)
    messages = {
      name: "=> Hello, what's your name?",
      marker: "=> Choose a marker:",
      first_turn: "=> Would you like to begin first?",
      square: "=> Choose a square:"
    }

    puts messages[key]
  end

  def self.choices(options)
    options += ['Random']
    count = options.count

    (1..count).to_a.zip(options).each do |num, option|
      puts "[#{num}] #{option}"
    end
  end

  def self.joinor(options)
    message = case options.size
              when 1    then options
              when 1..2 then options.join(' or ')
              else           "#{options[0..-2].join(', ')} or #{options[-1]}"
              end
    puts message
  end

  def self.invalid(type)
    messages = {
      choice: "Sorry, that's not a valid choice.",
      name: "Sorry, please enter a valid name.",
      yes_no: "Sorry, please enter [y]es or [n]o."
    }

    puts messages[type]
  end
end

class Board
  attr_reader :squares

  def initialize
    @squares = {}
    (1..9).each { |k| @squares[k] = Square.new }
  end

  def draw
    puts CONFIG['board'] % squares.values
  end

  def unmarked_squares
    squares.select { |_, square| square.unmarked? }.keys
  end

  def []=(key, marker)
    squares[key].marker = marker
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker

  def initialize
    set_name
  end
end

class Human < Player
  private

  def set_name
    @name = valid_name
  end

  def valid_name
    Displayable.prompt(:name)

    answer = nil
    loop do
      answer = gets.chomp.strip
      break if answer =~ /^[a-z]+ {0,1}[a-z]{0,}$/i
      Displayable.invalid(:name)
    end

    answer.split.map(&:capitalize).join(' ')
  end
end

class Computer < Player
  OPPONENTS = ['Bubbles', 'Blossom', 'Buttercup']

  private

  def set_name
    @name = OPPONENTS.sample
  end
end

class TTTGame
  MARKERS = ['O', 'X']

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    Displayable.welcome
    set_players
    board.draw
    human_moves
    computer_moves
  end

  private

  attr_reader :human, :computer

  def set_players
    @human = Human.new
    @computer = Computer.new
    human.marker = valid_choice(:marker, MARKERS)
    computer.marker = (MARKERS - [human.marker])[0]
    @current_marker = first_to_move
  end

  def valid_choice(key, options)
    Displayable.prompt(key)
    Displayable.choices(options)

    choice = nil
    loop do
      choice = gets.chomp.strip
      break if choice =~ /^\d$/ && (1..(options.size + 1)).include?(choice.to_i)
      Displayable.invalid(:choice)
    end

    choice == '3' ? options.sample : options[choice.to_i - 1]
  end

  def first_to_move
    choice = valid_choice(:first_turn, ['Yes', 'No'])
    @current_marker = (choice == 'Yes' ? human.marker : computer.marker)
  end

  def human_moves
    Displayable.prompt(:square)
    Displayable.joinor(board.unmarked_squares)
    board[valid_square] = human.marker
  end

  def valid_square
    square = nil

    loop do
      square = gets.chomp.strip
      break if square =~ /^\d$/ && board.unmarked_squares.include?(square.to_i)
      Displayable.invalid(:choice)
    end

    square.to_i
  end

  def computer_moves
    board[board.unmarked_squares.sample] = computer.marker
  end
end

TTTGame.new.play
