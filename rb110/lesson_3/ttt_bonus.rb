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

def valid_answer?(key)
  answer = nil
  prompt key

  loop do
    answer = gets.chomp.strip
    break if answer =~ /^(y|yes|n|no)$/i
    prompt "invalid_#{key}"
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
  system 'clear'
  puts CONFIG['board'] % brd
end

def empty_squares(brd)
  brd.filter_map.with_index { |v, i| i + 1 if v == ' ' }
end

def joinor(choices, delimiter = ', ', word = 'or')
  case choices.size
  when 1 then choices.first
  when 2 then choices.join(" #{word} ")
  else "#{choices[0..-2].join(delimiter)} #{word} #{choices[-1]}"
  end
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

def place_piece!(brd, player)
  square = (player == 'computer' ? computer_choice(brd) : player_choice(brd))
  brd[square - 1] = MARKERS[player]
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  markers = [MARKERS['player'], MARKERS['computer']]
  moves = WINNING_LINES.map { |i1, i2, i3| [brd[i1], brd[i2], brd[i3]] }

  markers.each do |marker|
    return MARKERS.key(marker) unless moves.select { |l| l.all?(marker) }.empty?
  end

  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def who_won(brd, name)
  winner = detect_winner(brd)
  winner == 'computer' ? winner.capitalize : name
end

# Main program

system 'clear'
prompt 'welcome'
name = valid_name
prompt 'greeting', "#{name}!"
display_rules if valid_answer?('view_rules')

loop do
  system 'clear'
  board = initialize_board

  loop do
    display_board(board)

    place_piece!(board, 'player')
    break if someone_won?(board) || board_full?(board)
    place_piece!(board, 'computer')

    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt 'winner', who_won(board, name)
  else
    prompt 'tie'
  end

  break unless valid_answer?('again')
end

prompt 'bye'
