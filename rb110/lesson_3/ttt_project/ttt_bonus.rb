require 'psych'
require 'io/console'

CONFIG = Psych.load_file('config_ttt.yml')
MARKERS = CONFIG['markers']
PLAYERS = CONFIG['players']
WINNING_LINES = CONFIG['winning_lines']
GRID_SIZE = 3**2
ROUNDS_TO_WIN = 5

def prompt(key, substitution = nil)
  msg = CONFIG['prompts'][key]
  msg = format(msg, substitution) if substitution
  puts msg
end

def whose_choice
  PLAYERS.sample
end

def pick_first(player)
  choice = nil

  if player == PLAYERS[1]
    choice = PLAYERS.sample
  else
    prompt 'player_choice'
    loop do
      choice = gets.chomp.strip
      break if choice =~ /^[1|2]$/
      prompt 'invalid_player_choice'
    end
  end

  PLAYERS[choice.to_i - 1]
end

def yes?(key)
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

def initialize_score
  [*PLAYERS, 'tie'].each_with_object({}) do |score, hsh|
    hsh[score] = 0
  end
end

def display_score(score)
  system 'clear'
  puts CONFIG['scoreboard'] % score.values
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

def winning_moves(brd)
  markers = MARKERS.fetch_values(*PLAYERS)
  squares = empty_squares(brd)
  possible_moves = PLAYERS.each_with_object({}) { |m, h| h[m] = [] }

  squares.product(markers).each do |square, marker|
    temp_brd = brd.dup
    temp_brd[square - 1] = marker
    possible_moves[MARKERS.key(marker)] << square if detect_winner(temp_brd)
  end

  possible_moves
end

def computer_choice(brd)
  player_wins, computer_wins = winning_moves(brd).values

  if !computer_wins.empty?
    computer_wins.sample
  elsif !player_wins.empty?
    player_wins.sample
  elsif empty_squares(brd).include?(5)
    5
  else
    empty_squares(brd).sample
  end
end

def place_piece!(brd, player)
  square = (player == PLAYERS[0] ? player_choice(brd) : computer_choice(brd))
  brd[square - 1] = MARKERS[player]
end

def alternate_player(current)
  PLAYERS.select { |player| player != current }.first
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  markers = MARKERS.fetch_values(*PLAYERS)
  lines = WINNING_LINES.map { |i1, i2, i3| [brd[i1], brd[i2], brd[i3]] }

  markers.each do |marker|
    return MARKERS.key(marker) unless lines.select { |l| l.all?(marker) }.empty?
  end

  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def who_won(brd)
  detect_winner(brd)
end

def update_score!(winner, score)
  if winner
    score[winner] += 1
  else
    score['tie'] += 1
  end
end

def match_won?(score)
  score.fetch_values(*PLAYERS).include?(ROUNDS_TO_WIN)
end

def match_winner(score)
  score.key(ROUNDS_TO_WIN)
end

# Main program

system 'clear'
prompt 'welcome'
display_rules if yes?('view_rules')

loop do
  system 'clear'
  starting_player = whose_choice
  prompt "pick_#{starting_player}"
  starting_player = pick_first(starting_player)
  prompt "first_#{starting_player}"
  sleep 2

  score = initialize_score

  until match_won?(score)
    system 'clear'
    current_player = starting_player
    board = initialize_board

    loop do
      display_score(score)
      display_board(board)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    round_winner = who_won(board)
    update_score!(round_winner, score)
    display_score(score)
    display_board(board)

    if someone_won?(board)
      prompt "round_#{round_winner}"
    else
      prompt 'tie'
    end

    break unless !match_winner(score) && yes?('continue')
  end

  prompt "champion_#{match_winner(score)}"
  break unless match_winner(score) && yes?('again')
end

prompt 'bye'
