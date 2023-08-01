require 'psych'
require 'pry'
require 'io/console'

CONFIG = Psych.load_file('config_ttt.yml')
MARKERS = CONFIG['markers']
WINNING_LINES = CONFIG['winning_lines']
GRID_SIZE = 3**2

def prompt(key, substitution = nil)
  msg = CONFIG['prompts'][key]
  msg = format(msg, substitution) if substitution
  puts msg
end

def valid_name
  name = nil

  loop do
    prompt 'name'
    name = gets.chomp.strip
    break if name =~ /^[a-z]+\ ?[a-z]*$/i
    prompt 'valid_name'
  end

  name.split.map(&:capitalize).join(' ')
end

def rules?
  answer = nil
  prompt 'view_rules'

  loop do
    answer = gets.chomp.strip
    break if answer =~ /^(y|yes|n|no)$/i
    prompt 'invalid_view_rules'
  end

  !!(answer =~ /^(y|yes)$/i)
end

def display_rules
  system 'clear'
  prompt 'rules'
  $stdin.getch
end

def initialize_board
  [MARKERS['initial']] * GRID_SIZE
end

def display_board(brd)
  puts CONFIG['board'] % brd
end

def empty_squares(brd)
  brd.filter_map.with_index { |v, i| i + 1 if v == ' ' }
end

def player_choice(brd)
  square = nil

  loop do
    prompt 'choose_square', joinor(empty_squares(brd))
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt 'invalid_square'
  end

  square
end

def computer_choice(brd)
  empty_squares(brd).sample
end

def place_piece!(brd, current_player)
  square =
    if current_player == 'player'
      player_choice(brd)
    else
      computer_choice(brd)
    end

  brd[square - 1] = MARKERS[current_player]
end

def joinor(choices, delimiter = ', ', word = 'or')
  case choices.size
  when 1 then choices.first
  when 2 then choices.join(" #{word} ")
  else "#{choices[0..-2].join(delimiter)} #{word} #{choices[-1]}"
  end
end

# Main program

system 'clear'
prompt 'welcome'
name = valid_name
prompt 'greeting', "#{name}!"
display_rules if rules?

system 'clear'
board = initialize_board
display_board(board)

place_piece!(board, 'player')
place_piece!(board, 'computer')
display_board(board)
