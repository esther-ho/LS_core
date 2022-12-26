=begin
--- P
Inputs:
- Two numbers
Output:
- Product of the input multiplied together

Implicit rules:
- Two numbers are given
--- E
multiply(5, 3) == 15
multiply(0, 4) == 0
multiply(7, 0) == 0
--- D

--- A
- Return the product of the two integers passed to the method
=end

def multiply(num1, num2)
  num1 * num2
end
# Using `*` operator can cause unexpected behaviors depending on left operand
# e.g. multiply('hi', 2) == 'hihi'
# e.g. multiply([1, 2], 2) == [1, 2, 1, 2]
# `Array#*` creates x copies of array and concatenates copies to the original

puts multiply(5, 3) == 15
puts multiply(0, 4) == 0
puts multiply(7, 0) == 0
