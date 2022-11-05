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
  - Display / Output the result
- Ask the user if they want to repeat the operation again
=end

require 'psych'

config = Psych.load_file('config.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(number)
  number == number.to_i.to_s || number == number.to_f.to_s
end

def operation_to_message(operator)
  message = case operator
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  message
end

prompt(config['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
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
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(config['valid_num'])
    end
  end

  number2 = ''
  loop do
    prompt(config['second_num'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(config['valid_num'])
    end
  end

  prompt(config['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(config['valid_operator'])
    end
  end

  prompt(operation_to_message(operator).to_s + config['operator_message'])

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  prompt(config['result'] + result.to_s)

  prompt(config['again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(config['bye'])
