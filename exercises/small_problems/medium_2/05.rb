=begin
--- P
Input:  3 integers representing sides of a triangle
Output: a symbol representing the type of triangle (equilateral, isoceles, scalene, invalid)

Rules:
- The sum of the two shortest sides must be greater than the length of the longest side
- All sides must be greater than 0
- Types:
  - equilateral: all three sides are equal
  - isoceles: two sides are equal
  - scalene: all sides are different

--- E
3, 3, 3 => :equilateral
3, 3, 1.5 => :isoceles
3, 4, 5 => :scalene
0, 3, 3 => invalid # one side is 0
3, 1, 1 => invalid # 1+1 == 2 which is smaller than 3

--- D
Input: three numbers
In-between: store sides in an array
Output: a symbol

--- A
- Determine if triangle is invalid
  - Check if any sides are of length  0
  - Check if the sum of the shorter sides are less than the length of the longest side
- If triangle is not invalid,
  - If all sides are equal, triangle is an equilateral triangle
  - Else, if only two sides are equal, triangle is an isoceles triangle
  - Else, triangle is a scalene triangle
=end

def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  return :invalid if sides.include?(0) || sides[0, 2].sum < sides[2]

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isoceles
  else        :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isoceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
