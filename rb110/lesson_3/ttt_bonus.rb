require 'psych'
require 'pry'
require 'io/console'

CONFIG = Psych.load_file('config_ttt.yml')
MARKERS = { initial: ' ', player: 'X', computer: 'O' }

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
  STDIN.getch
end

def initialize_board
  [MARKERS[:initial]] * 9
end

def display_board(brd)
  puts CONFIG['board'] % brd
end

# Main program

system 'clear'
prompt 'welcome'
name = valid_name

system 'clear'
prompt 'greeting', ("#{name}!")
display_rules if rules?

system 'clear'
board = initialize_board
display_board(board)
