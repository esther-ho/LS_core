=begin
--- P
Input: an integer, which represents the first n positive integers (1 to integer)
Output: an integer, which is the difference between:
- The square of the sum of the first n positive integers
- The sum of the squares of the first n positive integers

Rules:
- The given integer is positive
- The range of 1 to n is n-inclusive
--- E
(3) -> 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

1 -> 0
- 1**2 - 1**2 -> 0

--- D
Input: an integer
In-between:
- range of integers between 1 and given integer
Output: an integer

--- A
- Find the range of integers between 1 and the given integer
- Sum all the integers in the range and square the result
- Square all the integers in the range and sum the result
- Subtract the second result from the first result
=end

def sum_square_difference(num)
  square_sum = (1..num).to_a.sum**2
  sum_square = (1..num).map { |n| n**2 }.sum
  square_sum - sum_square
end

p sum_square_difference(3) == 22
    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
