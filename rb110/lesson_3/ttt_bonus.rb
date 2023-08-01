require 'psych'
require 'pry'
require 'io/console'

CONFIG = Psych.load_file('config_ttt.yml')
MARKERS = { initial: ' ', player: 'X', computer: 'O' }

def initialize_board
  [MARKERS[:initial]] * 9
end

def display_board(brd)
  puts CONFIG['board'] % brd
end

# Main program

system 'clear'
board = initialize_board
display_board(board)
