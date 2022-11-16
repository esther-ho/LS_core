=begin
- Ask the user for their name
  - Check if the name is valid
- Ask the user for one number
  - Check if the first number is valid
- Ask the user for another number
  - Check if the second number is valid
- Ask the user for an operation to perform
  - Check if the operation is valid
  - Display the operation that is being performed
  - Perform the operation on the two numbers
  - Simplify the result
  - Display the result
- Ask the user if they want to repeat the operation again
  - Check if the user input is valid
=end

# Load appropriate prompts from `YAML` file
require 'psych'

MESSAGES = Psych.load_file('config.yml')
LANGUAGE = 'en'

# Retrieve the appropriate prompt based on the language
def messages(message, lang='en')
  MESSAGES[lang][message]
end

# Add '=>' to all prompts
def prompt(message)
  puts("=> #{message}")
end

# Ask user for a valid name
def valid_name
  name = ''

  loop do
    name = gets.chomp.strip
    break if name !~ /\d|^$/
    prompt(MESSAGES['valid_name'])
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
def valid_number(input)
  number = ''

  loop do
    prompt(MESSAGES[input])
    number = gets.chomp
    break if number?(number)
    prompt(MESSAGES['valid_num'])
  end

  number = number.to_f
end

# Obtain a valid operator
def valid_operator
  operator = ''

  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(MESSAGES['valid_operator'])
  end

  operator
end

# Retrieve the appropriate message based on the chosen operator
def operation_to_message(operator)
  message = case operator
            when '1'
              MESSAGES['add']
            when '2'
              MESSAGES['subtract']
            when '3'
              MESSAGES['multiply']
            when '4'
              MESSAGES['divide']
            end
  message
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
    prompt(MESSAGES['valid_again'])
  end

  answer
end

# Calculator program
prompt(MESSAGES['welcome'])
name = valid_name
prompt("Hi #{name}!")

sleep(2)
system "clear"

loop do
  number1 = valid_number('first_num')
  number2 = valid_number('second_num')

  prompt(MESSAGES['operator_prompt'])
  operator = valid_operator
  prompt(operation_to_message(operator).to_s + MESSAGES['operator_message'])

  result =  case operator
            when '1'
              number1 + number2
            when '2'
              number1 - number2
            when '3'
              number1 * number2
            when '4'
              number1 / number2
            end

  sleep(2)
  prompt(MESSAGES['result'] + simplify_result(result))

  sleep(2)
  prompt(MESSAGES['again'])
  answer = again
  break if answer.eql?('n')
  system "clear"
end

prompt(MESSAGES['bye'])
