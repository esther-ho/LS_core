=begin
Input: a nested array with n rows and m columns
Output: a array rotated 90 deg, with m rows and n columns

Rules:
- Left elements are in the top row
- Middle elements are in the middle row
- Right elements are in the bottom row
- Rows and columns may not be of equal length

--- E
1 5 8     1 4 3     3 4 1
4 7 2 --> 5 7 9 --> 9 7 5
3 9 6     8 2 6     6 2 8

3 4 1     3 9     9 3
9 7 5 --> 4 7 --> 7 4
          1 5     5 1

--- D
Input: a nested array
Output: a nested array rotated 90 deg

--- A
- Transpose matrix
- Reverse each row
=end

def rotate90(matrix)
  matrix[0].zip(*matrix[1..]).map(&:reverse)
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
