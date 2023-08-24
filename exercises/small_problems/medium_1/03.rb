=begin
--- P
Input: an integer
Output: an integer where it is the maximum rotation of the given integer

Explicit rules:
- The integer will not have multiple 0s
- Leading zeros are dropped

Implicit rules:
- Every rotated integer is frozen

--- E
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

105 -> 051 -> 15

--- D
Input: an integer
In-between: a string representation of the integer
Output: an integer

--- A
- Rotate all integers until the last two integers are rotated
  - Convert integer to its string representation
  - Move the first characters to the end
  - Move the second characters to the end
  - Keep moving all characters until the second-last character has been moved
=end

def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_rightmost_digits(number, digits)
  number.to_s.sub(/\d{#{digits}}$/) { |chars| rotate_string(chars) }.to_i
end

def max_rotation(number)
  number.to_s.size.downto(2) do |digits|
    number = rotate_rightmost_digits(number, digits)
  end
  
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
