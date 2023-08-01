# Return a new array containing the same subarrays but ordered logically by their odd numbers

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr.sort_by { |subarr| subarr.select(&:odd?) }
