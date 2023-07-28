=begin
--- P
Input:
- A whole number larger than 0
Output:
- The sum of the individual digits of the whole numbers
- e.g. 10 => 1
Implicit rules:
- Underscores in the given numbers are ignored
- The input can be modified

--- E
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

--- D
- Use an array to store the individual digits of the given number

--- A
- Convert the given number to a string
- Split the string into an array containing its individual numeric characters
- Convert the numeric characters into integers
- Sum all the integers in the array
- Return the sum

=end

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
