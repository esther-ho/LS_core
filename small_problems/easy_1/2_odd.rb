=begin
Problem:
Write a method that takes one integer argument, which may be positive, negative, or zero.
This method returns `true` if the number's absolute value is odd.
You may assume that the argument is a valid integer value.
You're not allowed to use `#odd?` or `#even?` in your solution.

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

----- P
Input: One whole number that can be positive, negative, or zero
Outputs:
- `true` if the number is odd when the minus sign is removed
- `false` if the number is not odd when the minus sign is removed

Implicit rules:
- 0 is not a odd number
- The return value is a boolean: `true` or `false`
- The input can be mutated

----- E
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

----- D

----- A
- Convert the integer to its absolute value
- Check if the number returns a modulus of 0 when divided by 2
  - If it does not return `0`, return true
  - If it returns `0`, return `false`

=end

def is_odd?(integer)
  integer.abs % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
