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

p multiply(5, 3) == 15
p multiply(0, 4) == 0
p multiply(7, 0) == 0
