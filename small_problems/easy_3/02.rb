=begin
--- P
Inputs:
- Two positive whole numbers
Outputs:
The results when performing the following operations on the inputs:
- addition, subtraction, product, quotient, remainder, and power

Implicit rules
- Inputs will be valid numbers
- Return value should be an integer
- Second number is not a zero

--- E
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

--- D
- Store inputs in an array
- Store operators in an array
- Store results in an array

--- A
- Ask user for the first and second inputs
- Store them in an array
- Print results based on the operation

=end

numbers = []
nth_input = %w(first second)

nth_input.each do |nth|
  puts "==> Enter the #{nth} number:"
  numbers << gets.chomp.to_i
end

operators = %i(+ - * / % **)
operators.each do |operator|
  result = numbers.inject(operator)
  puts "==> #{numbers[0]} #{operator} #{numbers[1]} = #{result}"
end
