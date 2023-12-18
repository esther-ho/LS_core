require 'psych'

CONFIG = Psych.load_file('config_ttt.yml')

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

class TTTGame
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    board.draw
  end
end

TTTGame.new.play
