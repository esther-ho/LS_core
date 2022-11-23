=begin
1. Get input from the user
  - Multiple ways to indicate a valid input (e.g. '1', 'rock', 'r')
  - Convert user input into a valid input
2. Sample a input from possible choices for the computer
  - Provide a list of possible choices
3. Determine if player or computer won
  - Possible combinations of winning depending on input
  - Print the appropriate message if player win/loses/ties
4. Repeat RPSLS program until there are 3 wins
  - Keep track of number of wins for player and computer
  - Print out number of wins, loses, ties after each round
5. Repeat game if player answers 'y'
  - Keep track of number of rounds player has played
  - Number of rounds won or lost

=end

require 'psych'

MESSAGES = Psych.load_file('config_rpsls.yml')

def message(key)
  MESSAGES['prompts'][key]
end

def search_hash(key)
  MESSAGES['hashes'][key]
end

def prompt(key)
  puts "=> #{message(key)}"
end

def find_choice(input, key)
  search_hash(key).select do |_, v|
    v.include?(input)
  end.keys.first
end

def valid_choice
  choice = ''

  loop do
    prompt('choice')
    prompt('choice_example')
    input = gets.chomp.strip.downcase
    choice = find_choice(input, 'valid_inputs')
    break if choice
    prompt('valid_choice')
  end

  choice
end

system 'clear'
prompt('welcome')

loop do
  valid_choice
  break
end
