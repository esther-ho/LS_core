require 'psych'
require 'io/console'

CONFIG = Psych.load_file('config_ttt.yml')
MARKERS = CONFIG['markers']
PLAYERS = CONFIG['players']
WINNING_LINES = CONFIG['winning_lines']
GRID_SIZE = 3**2
CENTER_SQUARE = 5
ROUNDS_TO_WIN = 5

def prompt(key, substitution = nil)
  msg = CONFIG['prompts'][key]
  msg = format(msg, substitution) if substitution
  puts msg
end

def initialize_score
  [*PLAYERS, 'tie'].each_with_object({}) do |score, hsh|
    hsh[score] = 0
  end
end

def initialize_board
  [MARKERS['initial']] * GRID_SIZE
end

def prompt_pick_first
  choice = nil
  prompt 'player_choice'

  loop do
    choice = gets.chomp.strip
    break if choice =~ /^[1|2]$/
    prompt 'invalid_player_choice'
  end

  choice
end

def prompt_yes_no(key)
  answer = nil
  prompt key

  loop do
    answer = gets.chomp.strip
    break if answer =~ /^(y(es)*|n(o)*)$/i
    prompt "invalid_#{key}"
  end

  answer
end

def prompt_pick_square(board)
  square = nil

  loop do
    prompt 'choose_square', joinor(empty_squares(board))
    square = gets.chomp
    break if square =~ /^\d{1}$/ && empty_squares(board).include?(square.to_i)
    prompt 'invalid_square'
  end

  square.to_i
end

def display_rules
  system 'clear'
  prompt 'rules'
  $stdin.getch
end

def display_score(score)
  system 'clear'
  puts CONFIG['scoreboard'] % score.values
end

def display_board(board)
  puts CONFIG['board'] % board
end

def whose_choice
  PLAYERS.sample
end

def pick_first(player)
  choice = (player == PLAYERS[1] ? PLAYERS.sample : prompt_pick_first)
  PLAYERS[choice.to_i - 1]
end

def joinor(choices, delimiter = ', ', word = 'or')
  case choices.size
  when 1 then choices.first
  when 2 then choices.join(" #{word} ")
  else "#{choices[0..-2].join(delimiter)} #{word} #{choices[-1]}"
  end
end

def empty_squares(board)
  board.filter_map.with_index { |v, i| i + 1 if v == ' ' }
end

def winning_moves(board)
  markers = MARKERS.fetch_values(*PLAYERS)
  squares = empty_squares(board)
  possible_moves = PLAYERS.each_with_object({}) { |m, h| h[m] = [] }

  squares.product(markers).each do |square, marker|
    temp_board = board.dup
    temp_board[square - 1] = marker
    possible_moves[MARKERS.key(marker)] << square if detect_winner(temp_board)
  end

  possible_moves
end

def computer_choice(board)
  player_wins, computer_wins = winning_moves(board).values

  if !computer_wins.empty?
    computer_wins.sample
  elsif !player_wins.empty?
    player_wins.sample
  elsif empty_squares(board).include?(CENTER_SQUARE)
    CENTER_SQUARE
  else
    empty_squares(board).sample
  end
end

def place_piece!(board, player)
  square = if player == PLAYERS[0]
             prompt_pick_square(board)
           else
             computer_choice(board)
           end
  board[square - 1] = MARKERS[player]
end

def update_score!(winner, score)
  if winner
    score[winner] += 1
  else
    score['tie'] += 1
  end
end

def detect_winner(board)
  markers = MARKERS.fetch_values(*PLAYERS)
  lines = WINNING_LINES.map { |i1, i2, i3| [board[i1], board[i2], board[i3]] }

  markers.each do |marker|
    return MARKERS.key(marker) unless lines.select { |l| l.all?(marker) }.empty?
  end

  nil
end

def alternate_player(current)
  PLAYERS.select { |player| player != current }.first
end

def yes?(answer)
  !!(answer =~ /^(y(es)*)$/i)
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def match_won?(score)
  score.fetch_values(*PLAYERS).include?(ROUNDS_TO_WIN)
end

def who_won(board)
  detect_winner(board)
end

def match_winner(score)
  score.key(ROUNDS_TO_WIN)
end

# Main program

system 'clear'
prompt 'welcome'
view_rules = prompt_yes_no 'view_rules'

if yes?(view_rules)
  display_rules
else
  prompt 'start_game'
  $stdin.getch
end

system 'clear'
starting_player = whose_choice
prompt "pick_#{starting_player}"
starting_player = pick_first(starting_player)
prompt "first_#{starting_player}"
$stdin.getch

loop do
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

    break unless !match_won?(score)

    prompt 'continue'
    $stdin.getch
  end

  prompt "champion_#{match_winner(score)}"
  play_again = prompt_yes_no 'play_again'
  break unless yes?(play_again)

  starting_player = alternate_player(starting_player)
end

prompt 'bye'
