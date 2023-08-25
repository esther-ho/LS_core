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

# Alternative

# def max_rotation(number)
#   num_string = number.to_s
#   rotated_string = ''

#   until num_string.empty?
#     num_string = num_string[1..-1] + num_string[0]
#     rotated_string << num_string.slice!(0)
#   end

#   rotated_string.to_i
# end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Further exploration

# 735291 -> 352917 -> 329175 -> 321759 -> 321579
# 10001 -> 00011 -> 00110 -> 00101 -> 00110 -> 110

# def max_rotation(number)
#   num_string = number.to_s

#   num_string.size.downto(2) do |digits|
#     num_string.sub!(/\d{#{digits}}$/) { |chars| chars[1..-1] + chars[0] }
#   end

#   num_string.to_i
# end

# p max_rotation(10001) == 110
