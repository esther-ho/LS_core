=begin
--- P
Input: an integer, which represents 'n' in the n x n grid on which the 8-pointed star is on
Output: print an 8 pointed star on an n x n grid

Rules:
- n is an odd integer
- The smallest n is 7
- Middle line is made of n '*'s
- Other lines have 3 '*'s
- The star is mirrored at the middle

--- E
7:          spaces
*  *  *     0-2-2
 * * *      1-1-1
  ***       2-0-0
*******
  ***
 * * *
*  *  *

9:          spaces
*   *   *   0-3-3
 *  *  *    1-2-2
  * * *     2-1-1
   ***      3-0-0
*********
   ***
  * * *
 *  *  *
*   *   *

--- D
input: an integer
in-between:
- an array where each string element is a line in the star
output: print a 8-pointed star

--- A
- Create one side of the star
  - Find the numbers of lines that make up one side (not including the middle)
  - For each line, create the appropriate pattern of '*'s and spaces
- Print one side, its middle line, and the flipped version of one side
=end

def star(grid)
  bottom =
    (0...(grid / 2)).map do |line|
      %w(* * *).join(' ' * line).center(grid)
    end

  puts bottom.reverse, '*' * grid, bottom
end

star(7)
star(9)
