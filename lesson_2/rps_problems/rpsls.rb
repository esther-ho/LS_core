=begin
- Ask user if they would like to view instructions
- Get input from the user
  - Multiple ways to indicate a valid input (e.g. '1', 'rock', 'r')
  - Convert user input into a valid input
- Sample a input from possible choices for the computer
  - Provide a list of possible choices
- Determine if player or computer won
  - Possible combinations of winning depending on input
  - Print the appropriate message if player win/loses/ties
- Repeat RPSLS program until there are 3 wins
  - Keep track of number of wins for player and computer
  - Print out number of wins, loses, ties after each round
- Repeat game if player answers 'y'
  - Keep track of number of rounds player has played
  - Number of rounds won or lost

=end

require 'psych'
require 'io/console'

CONFIG = Psych.load_file('config_rpsls.yml')
CHOICES = CONFIG['choices']

def message(key)
  CONFIG['prompts'][key]
end

def prompt(key)
  puts "=> #{message(key)}"
end

# Accepts only names with alphabets, with at most one space
def valid_name
  name = ''

  loop do
    prompt('name')
    name = gets.chomp.strip
    break if /^[[:alpha:]]+\ ?[[:alpha:]]*$/.match(name)
    prompt('valid_name')
  end

  name.split.map(&:capitalize).join(' ')
end

def rules?
  answer = ''
  prompt('view_rules')
  prompt('view_rules_example')

  loop do
    answer = gets.chomp.strip.downcase
    break if %w(y yes n no).include?(answer)
    prompt('valid_view_rules')
  end

  %w(y yes).include?(answer)
end

# Switch between Page 1 and 2 of rules by pressing 'n' and 'b' keys
# Exit rules if any key other than 'n' or 'b' respectively is pressed
def display_rules
  loop do
    system 'clear'
    puts message('rules_1')
    break if STDIN.getch != 'n'
    system 'clear'
    puts message('rules_2')
    break if STDIN.getch != 'b'
  end
end

def display_score(name, score)
  puts message('break')
  puts message('current_score'), ''
  puts "#{name}'s win: #{score['player_win']}"
  puts "Computer's win: #{score['computer_win']}"
  puts "Ties: #{score['tie']}"
  puts message('break')
end

def find_choice(input)
  CHOICES.select do |_, v|
    v['inputs'].include?(input)
  end.keys.first
end

def valid_choice
  choice = ''
  prompt('choice')
  puts

  loop do
    input = gets.chomp.strip.downcase
    choice = find_choice(input)
    break if choice
    prompt('valid_choice')
  end

  choice
end

def win?(first, second)
  CHOICES[first]['beat'].include?(second)
end

def who_wins(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'tie'
  end
end

def win_message(winner)
  case winner
  when 'player'
    message('winner')['win']
  when 'computer'
    message('winner')['lose']
  when 'tie'
    message('winner')['tie']
  end
end

def computer_comment(winner)
  comment =
    case winner
    when 'player'
      message('win_message').sample
    when 'computer'
      message('lose_message').sample
    when 'tie'
      message('tie_message').sample
    end

  "#{message('computer_label')}\"#{comment}\""
end

def display_results(round, player, computer, winner)
  puts "Round #{round} - Results", ''
  puts "You chose: [#{player.capitalize}]"
  puts "Computer chose: [#{computer.capitalize}]", ''
  puts win_message(winner), ''
  puts computer_comment(winner)
  puts message('break')
  prompt('continue')
end

def count_wins(winner, score)
  case winner
  when 'player'
    score['player_win'] += 1
  when 'computer'
    score['computer_win'] += 1
  when 'tie'
    score['tie'] += 1
  end
end

def again?
  answer = ''
  prompt('again')
  prompt('again_example')

  loop do
    answer = gets.chomp.strip.downcase
    break if %w(y yes n no).include?(answer)
    prompt('valid_again')
  end

  %w(n no).include?(answer)
end

# Main RPSLS program
system 'clear'
puts message('welcome'), ''
name = valid_name

system 'clear'
puts (message('greeting') + name + '!'), ''
display_rules if rules?

loop do
  round = 1
  score = {
    'player_win' => 0,
    'computer_win' => 0,
    'tie' => 0
  }

  until score.values.take(2).include?(3)
    system 'clear'
    display_score(name, score)

    puts (message('round_label') + round.to_s), ''
    player = valid_choice
    computer = CHOICES.keys.sample
    winner = who_wins(player, computer)
    count_wins(winner, score)

    system 'clear'
    display_score(name, score)
    display_results(round, player, computer, winner)
    STDIN.getch

    round += 1
  end

  puts message('break')
  break if again?
  system 'clear'
end

prompt('bye')
