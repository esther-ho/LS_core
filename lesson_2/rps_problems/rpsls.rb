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
  puts name + message('score_player') + score['player_win'].to_s
  puts message('score_computer') + score['computer_win'].to_s
  puts message('score_tie') + score['tie'].to_s
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

def display_choices(player, computer)
  puts message('choice_player') + '[' + player.capitalize + ']'
  puts message('choice_computer') + '[' + computer.capitalize + ']'
end

def win_text(winner)
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
      message('computer_text')['win'].sample
    when 'computer'
      message('computer_text')['lose'].sample
    when 'tie'
      message('computer_text')['tie'].sample
    end

  message('computer_label') + '"' + comment + '"'
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

def match_winner(score, name)
  case score['player_win']
  when 3
    ['match_win', name]
  else
    ['match_lose', 'Computer']
  end
end

def display_congrats(match_result)
  puts message(match_result)['art'], ''
  puts message(match_result)['text']
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

  %w(y yes).include?(answer)
end

# Main RPSLS program
system 'clear'
puts message('welcome'), ''
name = valid_name

system 'clear'
puts (message('greeting') + name + '!'), ''
display_rules if rules?

previous_winner = '-'

loop do
  round = 1
  score = {
    'player_win' => 0,
    'computer_win' => 0,
    'tie' => 0
  }

  until score.values.take(2).include?(3)
    system 'clear'
    puts message('break')
    puts message('score_label'), ''
    puts message('previous_winner') + previous_winner
    display_score(name, score)
    puts message('break')

    puts (message('round_label') + round.to_s), ''
    player = valid_choice
    computer = CHOICES.keys.sample
    winner = who_wins(player, computer)
    count_wins(winner, score)

    system 'clear'
    puts message('break')
    puts message('score_label'), ''
    puts message('previous_winner') + previous_winner
    display_score(name, score)
    puts message('break')

    puts (message('results_label') + round.to_s), ''
    display_choices(player, computer)
    puts
    puts win_text(winner), ''

    puts computer_comment(winner)
    puts message('break')
    prompt('continue')
    STDIN.getch

    round += 1
  end

  match_result, previous_winner = match_winner(score, name)

  system 'clear'
  puts message('break')
  display_congrats(match_result)
  puts message('break')
  sleep(1)

  break unless again?
  system 'clear'
end

prompt('bye')
