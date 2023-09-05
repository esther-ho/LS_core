=begin
--- P
Input: two sorted arrays
Output: a new array with elements from both arrays in sorted order

Rules:
- Result array cannot be sorted
- Result array must be built one element at a time in proper order
- Input arrays should not be mutated
- Input arrays may be empty

--- E
[1, 1, 3], [2, 2] -> [1, 1, 2, 2, 3]
[], [1, 4, 5] -> [1, 4, 5]

--- D
Input: two input arrays
Output: a results array

--- A
- Make a copy of both input arrays
- Initialize the results array
- Find the longer array
- Add the smallest element from each array in order
  - Compare the first two elements of the two arrays
    If the first element of each array is not nil
    - Add the smaller element to the results array
- Return the results array
=end

def merge(arr1, arr2)
  arr1, arr2 = [arr1, arr2].map(&:dup)
  results = []

  until [arr1, arr2].max.size == 0
    if arr1[0].nil?
      results << arr2.shift
    elsif arr2[0].nil?
      results << arr1.shift
    elsif (arr1[0] <=> arr2[0]) < 1
      results << arr1.shift
    else
      results << arr2.shift
    end 
  end

  results
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
