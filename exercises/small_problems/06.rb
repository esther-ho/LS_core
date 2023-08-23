=begin
Input: two integers where,
- one integer is the count of elements in the output array
- second integer is the first number in the output array
Output: an array where,
- the number of elements is equal to the first integer
- the elements are multiples of the starting number
OR an empty array

Explicit rules:
- The elements in the array are multiples of the starting number
- The count will be 0 or greater
- The starting number can be any value
- An empty array is returned if the count is 0

Implicit rules:
- The elements can be the same number
- The elements can be sorted in increasing or decreasing order

--- E
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

--- D
Input: two integers
Output: an array of integers or empty array

(3, 1) -> [1, 2, 3]
(2, -1) -> [-1, -2]
(0, 10) -> []

--- A
- Find all multiples of the starting number
  - Create an array of starting numbers with a size of `count`
  - Multiply each number based on (its index + 1)
=end

def sequence(count, start_num)
  ([start_num] * count).map.with_index { |num, i| num * (i + 1) }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
