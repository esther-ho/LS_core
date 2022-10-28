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
  - Digit in the ones place is the last digit in the list
  - Followed by the digit in the tens place, etc
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
- Split the number into any array of individual digits
- Change the order of the array so that the digits are arranged from left to right following the given integer

=end

def digit_list(number)
  number.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
