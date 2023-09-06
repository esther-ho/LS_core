# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

=begin
--- P
Input: an array of integer(s)
Output: an array of integers

Rules:
- The size of the output array is the same as the size of the input array
- Each element in the output array is the count of numbers smaller than the given number
- The input array can have unique values
- Only count unique values
- Integers in the input array are positive

--- E
[7,7,7,7] -> 7 is the only number -> [0,0,0,0]

[8,1,2,2,3]
8 larger than 1, 2, and 3 -> 3
1 larger than none -> 0
2 larger than 1 -> 1, 1
3 larger than 1 and 2 -> 2

--- D
input: an array of numbers
in-between: the input array with only its unique values
output: an array of numbers

--- A
- For each value in the input array, find the number of unique values in the input array that are smaller than the given value
  - Iterate through the input array
  - For each value,
    - Count the number of unique values that are smaller than the given value
- Return the array of counts
=end

def smaller_numbers_than_current(numbers)
  numbers.map do |number|
    numbers.uniq.count { |num| num < number }
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".
