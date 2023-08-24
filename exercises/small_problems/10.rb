=begin
--- P
Input: a positive integer
Output: an integer - the sum of the digits of the input number

Explicit rules:
- The input integer is positive

--- E
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

--- D
Input: a positive integer
In-between: array of digits
Output: a positive integer - sum of the digits of the input

23 -> [2, 3] -> 5

--- A
- Split the number into its digits
- Sum all digits
=end

def sum(number)
  number.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
