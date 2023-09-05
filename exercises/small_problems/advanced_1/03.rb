=begin
--- P
Input: a nested array, where
- The number of subarrays is equal to the number of elements in each subarray
Output: a nested array, where
- Every 1st element, 2nd, 3rd...element is grouped in a subarray within the new nested array

Rules:
- Do not use #transpose or Matrix class methods
- The given matrix is 3 x 3

--- E
[[1, 4, 3], [5, 7, 9], [8, 2, 6]]
-> [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

--- D
Input: a nested array
Output: a nested array

--- A
- Pair each element with its corresponding elements in each new subarray
- Return new modified array

=end

def transpose(matrix)
  matrix[0].zip(*matrix[1..])
end

# Further exploration

def transpose!(matrix)
  0.upto(matrix.size - 1) do |row_i|
    row_i.upto(matrix.size - 1) do |col_i|
      matrix[row_i][col_i], matrix[col_i][row_i] = matrix[col_i][row_i], matrix[row_i][col_i]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
