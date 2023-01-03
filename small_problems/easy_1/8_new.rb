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
- Leading zeros in input will not be included
--- E
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
--- D
- Use an array to store individual digits
--- A
- Convert the integer to a string
- Split the string into an array of digits
- Reverse the array
- Join the digits in the array into a string of numbers
- Convert the string to an integer
=end
