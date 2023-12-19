require 'psych'
require 'pry'

CONFIG = Psych.load_file('config_ttt.yml')

module Displayable
  def self.welcome
    puts "Welcome to Tic Tac Toe!\n"
  end

  def self.choose_marker
    puts "Choose a marker:\n"
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
end

class Square
  INITIAL_MARKER = ' '

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  def initialize(marker)
    @marker = marker
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
  end

  private

  attr_reader :human, :computer

  def set_players
    human_choice = valid_marker
    computer_choice = (MARKERS - [human_choice])[0]
    @human = Player.new(human_choice)
    @computer = Player.new(computer_choice)
  end

  def valid_marker
    Displayable.choose_marker
    count = MARKERS.count
    (1..count).to_a.zip(MARKERS).each do |num, marker|
      puts "[#{num}] #{marker}"
    end

    choice = nil
    loop do
      choice = gets.chomp
      break if choice =~ /^\d$/ && (1..count).include?(choice.to_i)
      Displayable.invalid(:choice)
    end

    MARKERS[choice.to_i - 1]
  end
end

TTTGame.new.play
