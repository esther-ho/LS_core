=begin
--- P
Input: an nested array, with n rows and m columns
Output: a nested array, with m rows and n columns

Rules:
- The new nested array's columns and rows are switched
- Each matric has at least 1 column and 1 row

--- E
[[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]

--- D
Input: a nested array
Output: a nested array

--- A
- Pair the first elements, second elements...etc together in new subarrays in the new array
=end

def transpose(matrix)
  matrix[0].zip(*matrix[1..])
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
