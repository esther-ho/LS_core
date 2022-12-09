require 'psych'
require 'io/console'

CONFIG = Psych.load_file('config_rpsls.yml')
CHOICES = CONFIG['choices']
ROUNDS_TO_WIN = 3

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

def join(text, values)
  text.zip(values).map!(&:join)
end

def scores(grand_winner, name, score)
  text = [
    message('grand_winner'),
    name + message('score_player'),
    message('score_computer'),
    message('score_tie')
  ]

  values = [grand_winner, score.values].flatten
  join(text, values)
end

def display_scoreboard(grand_winner, name, score)
  puts message('break')
  puts message('score_label'), ''
  puts scores(grand_winner, name, score)
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

def player_win?(player, computer)
  if win?(player, computer)
    'win'
  elsif win?(computer, player)
    'lose'
  else
    'tie'
  end
end

def choices(player, computer)
  text = [
    message('choice_player'),
    message('choice_computer')
  ]

  values = [
    "[#{player.capitalize}]",
    "[#{computer.capitalize}]"
  ]

  join(text, values)
end

def win_text(result)
  message('winner')[result]
end

def computer_comment(result)
  comment = message('computer_text')[result].sample
  message('computer_label') + '"' + comment + '"'
end

def display_results(round, player, computer, result)
  puts (message('results_label') + round.to_s), ''
  puts choices(player, computer), ''
  puts win_text(result), ''
  puts computer_comment(result)
  puts message('break')
end

def update_score(result, score)
  case result
  when 'win'
    score['player_win'] += 1
  when 'lose'
    score['computer_win'] += 1
  when 'tie'
    score['tie'] += 1
  end
end

def match_winner(score, name)
  case score['player_win']
  when ROUNDS_TO_WIN
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

grand_winner = '-'

loop do
  round = 1
  score = {
    'player_win' => 0,
    'computer_win' => 0,
    'tie' => 0
  }

  until score.values[0, 2].include?(ROUNDS_TO_WIN)
    system 'clear'
    display_scoreboard(grand_winner, name, score)

    puts (message('round_label') + round.to_s), ''
    player = valid_choice
    computer = CHOICES.keys.sample
    round_result = player_win?(player, computer)
    update_score(round_result, score)

    system 'clear'
    display_scoreboard(grand_winner, name, score)
    display_results(round, player, computer, round_result)
    prompt('continue')
    STDIN.getch

    round += 1
  end

  match_result, grand_winner = match_winner(score, name)

  system 'clear'
  puts message('break')
  display_congrats(match_result)
  puts message('break')
  sleep(1)

  break unless again?
  system 'clear'
end

prompt('bye')
