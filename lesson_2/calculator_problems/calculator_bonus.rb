require 'psych'

MESSAGES = Psych.load_file('config.yml')
LANGUAGE = 'en'

# Retrieve the appropriate prompt based on the language
def message(key, lang=LANGUAGE)
  MESSAGES[lang][key]
end

# Add '=>' to all prompts
def prompt(message)
  puts "=> #{message}"
end

# Ask user for a valid name
def valid_name
  name = ''

  loop do
    name = gets.chomp.strip
    break if name !~ /\d|^$/
    prompt(message('valid_name'))
  end

  name.capitalize
end

# Check if input is a valid number
# Will return false for edge cases e.g. '00', '4.', '.5'
def integer?(number)
  number == number.to_i.to_s
end

def float?(number)
  number == number.to_f.to_s
end

def number?(number)
  integer?(number) || float?(number)
end

# Obtain an input and save if it's a valid number
def valid_number(key)
  number = ''

  loop do
    prompt(message(key))
    number = gets.chomp
    break if number?(number)
    prompt(message('valid_num'))
  end

  number = number.to_f
end

# Obtain a valid operator
def valid_operator
  operator = ''

  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(message('valid_operator'))
  end

  operator
end

# Retrieve the appropriate message based on the chosen operator
def operation_to_message(operator)
  message = case operator
            when '1'
              message('add')
            when '2'
              message('subtract')
            when '3'
              message('multiply')
            when '4'
              message('divide')
            end
  message
end

# Perform the appropriate operation
def operation_result(operator, num1, num2)
  case operator
  when '1'
    num1 + num2
  when '2'
    num1 - num2
  when '3'
    num1 * num2
  when '4'
    num1 / num2
  end
end

# Convert a float to an integer if the float ends with '.0'
def simplify_result(number)
  if number.to_s.end_with?('.0')
    number.to_s.sub('.0', '')
  else
    number.to_s
  end
end

# Ensure user enters 'Y' or 'N'
def again
  answer = ''

  loop do
    answer = gets.chomp.downcase
    break if %w(y n).include?(answer)
    prompt(message('valid_again'))
  end

  answer
end

# Calculator program
prompt(message('welcome'))
name = valid_name
prompt(message('greeting') + name + '!')

sleep(1)

loop do
  num1 = valid_number('first_num')
  num2 = valid_number('second_num')

  prompt(message('operator_prompt'))
  operator = valid_operator
  prompt(operation_to_message(operator))

  result = operation_result(operator, num1, num2)

  sleep(2)
  prompt(message('result') + simplify_result(result))

  sleep(1)
  prompt(message('again'))
  answer = again
  break if answer.eql?('n')
  system "clear"
end

prompt(message('bye'))
