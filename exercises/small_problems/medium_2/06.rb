=begin
--- P
Input: Three integers representing angles of a triangle
Output: A symbol representing the type of triangle
- Right - one angle is 90deg
- Acute - all angles are less than 90deg
- Obtuse - one angle is greater than 90deg
- Invalid

Rules:
- All angles must sum to 180
- All angles must be greater than 0
- All numbers given are integers

--- E
60, 70, 50 -> acute # all less than 90
30, 90, 60 -> right # one 90
120, 50, 10 -> obtuse # one greater than 90
0, 90, 90 -> invalid # contains 0
50, 50, 50 -> invalid # sum is not 180

--- D
Input: three integers
In-between: an array to store all sides
Output: symbol

--- A
- Determine if the triangle is invalid
  - Sum of all angle is not 180 OR at least one angle is 0
- If the triangle is valid
  - If the largest angle is larger than 90, it is an obtuse triangle
  - If the largest angle is 90, it is a right-angle triangle
  - If the largest angle is less than 90, it is an acute triangle
=end

def triangle(*angles)
  angles.sort!
  return :invalid if angles.sum != 180 || angles.include?(0)

  case angles.max
  when 91.. then :obtuse
  when 90   then :right
  else           :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
