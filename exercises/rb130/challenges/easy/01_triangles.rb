=begin
--- P
Input: 3 integers
Output: string (equilateral, isosceles, scalene) or raise error
Rules:
- Sides must be length > 0
- Sum of any two sides must be larger than 3rd side
--- E
- [3, 3, 3] -> equilateral
- [2, 2, 1] -> isosceles
- [1, 1, 1] -> scalene
- [1, 2, 3] -> error
- [-1, 1, 1] -> error
--- D
Input: integer
In-between: array of integers
Output: string
--- A
- If any integer is negative, raise error
- If sum of two smallest sides is not greater than remaining side, raise error
- Count number of unique integers:
  - If 1, return equilateral
  - If 2, return isoceles
  - Else, return scalene
=end

class Triangle
  def initialize(s1, s2, s3)
    validate_triangle([s1, s2, s3])
    @sides = [s1, s2, s3]
  end

  def kind
    case @sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else        'scalene'
    end
  end

  private

  def validate_triangle(sides)
    raise ArgumentError, "Length of sides must be greater than 0" if any_nonpositive_side?(sides)
    raise ArgumentError, "Sum of any 2 sides must be greater than the 3rd side" if invalid_side_sum?(sides)
  end

  def any_nonpositive_side?(sides)
    !sides.any?(&:positive?)
  end

  def invalid_side_sum?(sides)
    *shorter, long = sides.sort
    shorter.sum <= long
  end
end
