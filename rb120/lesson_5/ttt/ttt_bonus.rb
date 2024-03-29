require 'psych'
require 'pry'

CONFIG = Psych.load_file('config_ttt.yml')

module Display
  def self.welcome
    puts "=> Welcome to Tic Tac Toe!"
  end

  def self.prompt(key)
    messages = {
      name: "=> What's your name?",
      marker: "=> Choose a marker:",
      first_turn: "=> Would you like to begin first?",
      square: "=> Choose a square:",
      play_again: "=> Would you like to play again? Enter [y]es or [n]o."
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
              when 1 then options
              when 2 then options.join(' or ')
              else        "#{options[0..-2].join(', ')} or #{options[-1]}"
              end
    puts message
  end

  def self.invalid(type)
    messages = {
      choice: "=> Sorry, that's not a valid choice.",
      name: "=> Sorry, please enter a valid name.",
      yes_no: "=> Sorry, please enter [y]es or [n]o."
    }

    puts messages[type]
  end

  def self.start_game
    puts "=> You will be playing against the computer."
    puts "=> The goal is to get 3 marks in a row."
    puts "=> First one to win 3 rounds is the winner of the match!"
    puts "=> Press [enter] to continue."
    gets
  end

  def self.markers(human, computer)
    puts "You are '#{human}'. Your opponent is '#{computer}'."
  end

  def self.round_result(winner, name)
    messages = {
      human: "=> You won!",
      computer: "=> #{name} won!",
      tie: "=> It's a tie!"
    }

    puts messages[winner]
  end

  def self.scoreboard(human_info, computer_info)
    puts
    [human_info, computer_info].each do |info|
      puts format("%{name}'s score: %{score}", info)
    end
    puts
  end

  def self.continue
    puts "=> Press [enter] to continue."
    gets
  end

  def self.grand_winner(name)
    puts "=> #{name} is the winner of the match!"
  end

  def self.goodbye
    puts "=> Thank you for playing Tic Tac Toe! Goodbye!"
  end
end

class Board
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts CONFIG['board'] % squares.values
  end

  def unmarked_squares
    squares.select { |_, square| square.unmarked? }.keys
  end

  def [](key)
    squares[key]
  end

  def []=(key, marker)
    squares[key].marker = marker
  end

  def full?
    unmarked_squares.empty?
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = self.squares.values_at(*line)
      return squares[0].marker if winning_line?(squares)
    end

    nil
  end

  def possible_winning_markers
    possible_wins = {}

    WINNING_LINES.each do |line|
      squares = self.squares.values_at(*line)
      if possible_winning_line?(squares)
        winning_marker = squares.reject(&:unmarked?)[0].marker
        winning_square = line.find { |key| self.squares[key].unmarked? }
        possible_wins[winning_marker] = winning_square
      end
    end

    possible_wins
  end

  def someone_won?
    !!winning_marker
  end

  def reset
    (1..9).each { |k| squares[k] = Square.new }
  end

  private

  attr_reader :squares

  def winning_line?(squares)
    markers = squares.reject(&:unmarked?).map(&:marker)
    return false unless markers.size == 3
    markers.uniq.size == 1
  end

  def possible_winning_line?(squares)
    squares.one?(&:unmarked?) && squares.map(&:marker).uniq.size == 2
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
  attr_reader :name
  attr_accessor :marker, :score

  def initialize
    set_name
    @score = 0
  end

  def update_score
    self.score += 1
  end

  def reset_score
    self.score = 0
  end
end

class Human < Player
  private

  def set_name
    @name = valid_name
  end

  def valid_name
    Display.prompt(:name)

    answer = nil
    loop do
      answer = gets.chomp.strip
      break if answer =~ /^[a-z]+ {0,1}[a-z]{0,}$/i
      Display.invalid(:name)
    end

    answer.split.map(&:capitalize).join(' ')
  end
end

class Computer < Player
  OPPONENTS = ['Baymax', 'Eve', 'WALL-E']

  private

  def set_name
    @name = OPPONENTS.sample
  end
end

class TTTGame
  MARKERS = ['O', 'X']
  MIDDLE_SQUARE = 5
  ROUNDS_TO_WIN = 3

  def initialize
    @board = Board.new
  end

  def play
    system 'clear'
    Display.welcome
    set_players
    Display.start_game
    main_game
    Display.goodbye
  end

  private

  attr_reader :human, :computer, :board, :first_marker, :current_marker

  def clear_screen_and_display_board
    system 'clear'
    Display.markers(human.marker, computer.marker)
    puts
    board.draw
  end

  def set_players
    @human = Human.new
    @computer = Computer.new
    human.marker = valid_choice(:marker, MARKERS)
    computer.marker = (MARKERS - [human.marker])[0]
    @current_marker = first_to_move
  end

  def valid_choice(key, options)
    Display.prompt(key)
    Display.choices(options)

    choice = nil
    loop do
      choice = gets.chomp.strip
      break if choice =~ /^\d$/ && (1..(options.size + 1)).include?(choice.to_i)
      Display.invalid(:choice)
    end

    choice == '3' ? options.sample : options[choice.to_i - 1]
  end

  def first_to_move
    choice = valid_choice(:first_turn, ['Yes', 'No'])
    marker = (choice == 'Yes' ? human.marker : computer.marker)
    @first_marker = marker
  end

  def main_game
    loop do
      play_match
      display_grand_winner
      break unless play_again?
      reset_match
    end
  end

  def play_match
    loop do
      clear_screen_and_display_board
      player_move
      display_result
      display_score
      break if game_over?
      Display.continue
      reset_round
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def human_turn?
    current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_moves
    Display.prompt(:square)
    Display.joinor(board.unmarked_squares)
    board[valid_square] = human.marker
  end

  def valid_square
    square = nil

    loop do
      square = gets.chomp.strip
      break if square =~ /^\d$/ && board.unmarked_squares.include?(square.to_i)
      Display.invalid(:choice)
    end

    square.to_i
  end

  def computer_moves
    next_move = if board[MIDDLE_SQUARE].unmarked?
                  MIDDLE_SQUARE
                else
                  computer_attack || computer_defend || computer_random
                end

    board[next_move] = computer.marker
  end

  def computer_attack
    board.possible_winning_markers[computer.marker]
  end

  def computer_defend
    board.possible_winning_markers[human.marker]
  end

  def computer_random
    board.unmarked_squares.sample
  end

  def display_result
    clear_screen_and_display_board
    Display.round_result(round_winner, computer.name)
  end

  def round_winner
    case board.winning_marker
    when human.marker
      human.update_score
      :human
    when computer.marker
      computer.update_score
      :computer
    else
      :tie
    end
  end

  def display_score
    human_info = { name: human.name, score: human.score }
    computer_info = { name: computer.name, score: computer.score }
    Display.scoreboard(human_info, computer_info)
  end

  def reset_round
    @current_marker = alternate_first_player
    board.reset
  end

  def reset_match
    reset_round
    human.reset_score
    computer.reset_score
  end

  def alternate_first_player
    marker = (first_marker == human.marker ? computer.marker : human.marker)
    @first_marker = marker
  end

  def game_over?
    [human.score, computer.score].any?(ROUNDS_TO_WIN)
  end

  def display_grand_winner
    name = nil
    [human, computer].each do |player|
      name = player.name if player.score == ROUNDS_TO_WIN
    end

    Display.grand_winner(name)
  end

  def play_again?
    Display.prompt(:play_again)

    answer = nil
    loop do
      answer = gets.chomp.strip.downcase
      break if answer =~ /^(y|n|yes|no)$/
      Display.invalid(:yes_no)
    end

    answer.match?(/^(y|yes)$/)
  end
end

TTTGame.new.play
