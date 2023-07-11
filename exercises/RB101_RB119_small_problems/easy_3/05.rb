=begin
--- P
Inputs:
- One number
Outputs:
- The square of the given number

Implicit rules:
- Only numeric values are given
- Method used should be similar to `multiply`
--- E
square(5) == 25
square(-8) == 64
--- D

--- A
- Multiply the number by itself
=end

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64

# square('hi') => raises TypeError
# square([1, 2]) => raises TypeError

# Only works if exponent is an integer
def power_to_n(base, exponent)
  return 1 if exponent == 0
  result = multiply([base], exponent.abs).inject(:*)
  exponent > 0 ? result : (1.0 / result)
end

puts power_to_n(5, 2) == 25
puts power_to_n(10, 3) == 1000
puts power_to_n(10, -2) == 0.01
puts power_to_n(2.5, 2) == 6.25
puts power_to_n(0, 5) == 0

# Using recursion
def power_recurse(base, exponent)
  return 1 if exponent == 0
  return base if exponent == 1
  result = multiply(base, power_recurse(base, exponent.abs - 1))
  exponent > 0 ? result : (1.0 / result)
end

puts power_recurse(5, 2) == 25
puts power_recurse(10, 3) == 1000
puts power_recurse(10, -2) == 0.01
puts power_recurse(2.5, 2) == 6.25
puts power_recurse(0, 5) == 0
