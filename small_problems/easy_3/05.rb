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
