# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

=begin
--- P
Input: an array of numbers
Output: an integer, which represents the minimum sum of 5 consecutive numbers, or nil

Rules:
- The method should return nil if there are fewer than 5 elements
- The given array is not ordered
- Numbers in the given array can be positive, negative, or zero
- The minimum sum can be positive, negative, or zero

--- E
[1, 2, 3, 4] -> nil
[1, 2, 3, 4, 5, 6] -> 15

--- D
Input: an array of integers
In-between: all possible sums of 5 consecutive numbers
Output: nil or an integer

--- A
- Check if the array has at least 5 elements
  - Return nil if array is smaller than 5
- Initialize an array to contain all possible sums
- Find the possible sums of 5 consecutive numbers
  - Iterate through the array
    - Find all possible 5 consecutive number groups
    - Sum all 5 consecutive numbers
    - Push each possible sum into the `sums` array
- Return the lowest possible sum
=end

def minimum_sum(numbers)
  return nil if numbers.size < 5

  sums = []
  numbers.each_cons(5) { |nums| sums << nums.sum }
  sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".
