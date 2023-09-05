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

# Further exploration

# 180 degree rotation
# 1 5 8     3 9 6     6 9 3
# 4 7 2 --> 4 7 2 --> 2 7 4
# 3 9 6     1 5 8     8 5 1

# 3 4 1 --> 9 7 5 --> 5 7 9
# 9 7 5     3 4 1     1 4 3

# 270 degree rotation
# 1 5 8     1 4 3     8 2 6
# 4 7 2 --> 5 7 9 --> 5 7 9
# 3 9 6     8 2 6     1 4 3

# 3 4 1 --> 3 9 --> 1 5
# 9 7 5     4 7     4 7
#           1 5     3 9


def rotate(degrees = 90, matrix)
  case degrees
  when 90  then matrix[0].zip(*matrix[1..]).map(&:reverse)
  when 180 then matrix.reverse.map(&:reverse)
  when 270 then matrix[0].zip(*matrix[1..]).reverse
  when 360 then matrix
  else          "Invalid input"
  end
end

# Alternative

def rotate(degrees = 90, matrix)
  return "Invalid input" unless degrees % 90 == 0

  (degrees / 90).times do
    matrix = matrix[0].zip(*matrix[1..]).map(&:reverse)
  end

  matrix
end

p rotate(matrix1) == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p rotate(matrix2) == [[5, 3], [1, 7], [0, 4], [8, 2]]
p rotate(180, matrix1) == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]
p rotate(180, matrix2) == [[8, 0, 1, 5], [2, 4, 7, 3]]
p rotate(270, matrix1) == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]
p rotate(270, matrix2) == [[2, 8], [4, 0], [7, 1], [3, 5]]
p rotate(360, matrix1) == matrix1
p rotate(360, matrix2) == matrix2
