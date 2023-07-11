=begin
----- P
Input:
- A whole number larger than zero
Output:
- A string with length matching the given number, with 1s and 0s alternating starting with 1

Implicit rules:
- The input can be modified

----- E
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

----- D

----- A
- Multiply the string '10' by the result of the integer divided by 2
- If the given integer is odd,
  - Append '1' to the resulting string
- Return the new string

=end

def stringy(number)
  string = '10' * (number / 2)
  string << '1' if number.odd?
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
