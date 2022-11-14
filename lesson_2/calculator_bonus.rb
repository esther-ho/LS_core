=begin
- Ask the user for their name
  - Check if the name is valid
- Ask the user for one number
  - Check if the first number is valid
  - Improve integer validation (allow '0' to be an input)
  - Improve number validation - both integers or floats are valid
- Ask the user for another number
  - Check if the second number is valid
- Ask the user for an operation to perform
  - Check if the operation is valid
  - Display the operation that is being performed
  - Perform the operation on the two numbers
  - Simplify the result
  - Display / Output the result
- Ask the user if they want to repeat the operation again
=end

require 'psych'

config = Psych.load_file('config.yml')

def prompt(message)
  puts("=> #{message}")
end

def number?(number)
  number == number.to_i.to_s || number == number.to_f.to_s
end

def operation_to_message(operator, config)
  message = case operator
            when '1'
              config['add']
            when '2'
              config['subtract']
            when '3'
              config['multiply']
            when '4'
              config['divide']
            end
  message
end

def simplify_result(number)
  if number.to_s.end_with?('.0')
    number.to_s.sub('.0','')
  else
    number.to_s
  end
end

prompt(config['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(config['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  number1 = ''
  loop do
    prompt(config['first_num'])
    number1 = gets.chomp

    if number?(number1)
      number1 = number1.to_f
      break
    else
      prompt(config['valid_num'])
    end
  end

  number2 = ''
  loop do
    prompt(config['second_num'])
    number2 = gets.chomp

    if number?(number2)
      number2 = number2.to_f
      break
    else
      prompt(config['valid_num'])
    end
  end

  prompt(config['operator_prompt'])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(config['valid_operator'])
    end
  end

  prompt(operation_to_message(operator, config).to_s + config['operator_message'])

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

  prompt(config['result'] + simplify_result(result))

  prompt(config['again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(config['bye'])
