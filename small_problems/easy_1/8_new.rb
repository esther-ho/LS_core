=begin
--- P
Input:
- Whole number greater than 0
Output:
- Return a number with reversed digits
  - E.g. digit in largest place value is at smallest place value
Implicit rules:
- Argument will be a valid positive whole number
- Any leading zeros (0s in front) of reversed number are removed
--- E
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
--- D

--- A
- Convert the integer to a string
- Reverse the string
- Convert the string to an integer
=end

def reversed_number(number)
  number.to_s.reverse.to_i
  # alternative: `number.digits.join.to_i`
  # `Integer#digits` returns an array starting with the smallest place value
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
