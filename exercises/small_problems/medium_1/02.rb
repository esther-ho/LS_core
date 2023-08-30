=begin
--- P
Input: two integers where,
- first is the number
- second is the number of digits to be rotated
Output: an integer that may have been rotated

Explicit rules
- Rotating one digit results in the original number being returned
- Number of digits being rotated depends on the first integer passed to the method

Implicit rules
- Rotating two digits results in the second-last digit being moved to the end
- Rotating three digits results in the third-last digit being moved to the end

--- E
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

735291 -> 735219 -> 735912

--- D
Input: two integers
In-between: an array of digits are rotated
Output: an integer

--- A
- Collect only the subset of digits that will be rotated
  - Convert the integer to a string
  - Take only the last n number of characters
- Rotate the characters
  - Move the first character to the end
- Append the digits back to the digits that were not rotated
  - Concatenate the rotated characters back to the non-rotated string
=end

def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_rightmost_digits(number, digits)
  num_string = number.to_s
  num_string.sub!(/\d{#{digits}}$/) { |n| rotate_string(n) }
  num_string.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
