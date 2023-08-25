# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

=begin
--- P
Input: an odd positive integer
Output: a 4-pointed triangle made of `*` within an n x n grid, where n is the given integer

Explicit rules:
- n is an odd integer

Implicit rules:
- n is positive
- The diamond is displayed by `*`
- The line at the center of the diamond is of n-length
- As we get further from the middle, each line is shorter by 2 `*`
- The number of spaces decrease by one for each line as we get further from the middle
- If the line is n-th away from the middle, it is preceded by n-number of spaces

--- E
# diamond(1)

# *

# diamond(3)

#  *
# ***
#  *

#  diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

--- D
Input: integer
Output: an array of strings, where each element is a string of `*` and spaces that is a line within the diamond

1 -> ['*'] -> *
3 -> [' *', '***', ' *'] =>
 * 
***
 *

--- A
- Generate the middle of the diamond
  - Create a string containing '*' of n length
- Generate one end of the diamond
  - Iterate through a range of odd numbers from 1 to n (n not inclusive)
    - For each iteration,
      - Prepend the string with spaces
        - For 9 x 9 diamond,
          - Line 1 has 4 preceding spaces
          - Line 2 has 3 preceding spaces...
      - Append '*'s based on the element at that iteration
- Join both ends to the middle of the diamond
  - Make a copy of the end and reverse it
  - Join both ends to the middle
=end

def diamond(size)
  middle = '*' * size
  one_end = (1...size).step(2).to_a

  one_end.map!.with_index do |length, i|
    ' ' * (size / 2 - i) + '*' * length
  end

  one_end + [middle] + one_end.reverse
end

puts diamond(1)
puts diamond(3)
puts diamond(9)
