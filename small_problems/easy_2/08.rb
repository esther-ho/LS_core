=begin
--- P
Inputs:
- User input of an integer greater than 0
- User to choose between computing'sum' or 'product'
Output:
- Depending on user's choice, print:
  - Sum of all numbers between 1 and given number
  - Product of all numbers between 1 and given number
Implicit rules:
- Given number is a whole number
- Given number is included in the sum or product
- User can only enter 's' or 'p' as an operation
--- E
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.
--- D

--- A
- Ask user for an whole number greater than 0
- Validate user input
- Store input and convert it to an integer
- Ask user to choose to compute sum or product
- Validate user input
- Store input
- If user enters 's'
  - Sum all numbers from 1 to given integer
- If user enter 'p',
  - Multiply all numbers from 1 to given integer
- Print the result
=end

def valid_num
  number = ''

  loop do
    number = gets.chomp
    break if /^[[:digit:]]+$/.match(number) && number.to_i > 0
    puts "That doesn't look like a valid number. " \
         "Please try again."
  end

  number.to_i
end

def valid_operation
  operation = ''

  loop do
    operation = gets.chomp.downcase
    break if %w(s p).include?(operation)
    puts "Oops. Unknown operation. " \
         "Please enter 's' or 'p'."
  end

  operation
end

puts ">> Please enter an integer greater than 0:"
number = valid_num

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = valid_operation

case operation
when 's'
  result = (1..number).sum
  puts "The sum of the integers between 1 and #{number} is #{result}."
when 'p'
  result = (1..number).inject(:*) # reduce(:*)
  puts "The product of the integers between 1 and #{number} is #{result}."
end
