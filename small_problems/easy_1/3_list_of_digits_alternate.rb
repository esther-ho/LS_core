=begin
Problem:
Write a method that takes one argument (a positive integer) and returns a list of the digits in the number.

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

----- P
Input: A whole number greater than 0
Output: A list of individual digits making up the input number

Implicit rules:
- The digits are listed in the order they appear in the number from left to right
  - Digit in the ones' place is the last digit in the list
  - Followed by the digit in the ten's place, etc
- Digits can appear multiple times in the list if they are repeated in the number
- 0 is a valid digit if the number is larger than 0

----- E
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

----- D
Use an array to store the list of digits as the output

----- A
If #digits was not available
- Create an empty array
- While the given number is greater than 0,
  - Push the modulo of the number when divided by 10 into the empty array
  - Divide the number by 10 and reassign it as the number
- Reverse the array so the digits are ordered from left to right as they appear in the number

=end

def digit_list(number)
  digits = []

  while number > 0
    digits << number % 10
    number /= 10
  end

  digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
