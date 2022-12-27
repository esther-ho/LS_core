=begin
--- P
Inputs:
- An array
Outputs:
- An array with only odd-place elements, e.g. 1st (index 0), 3rd (index 2) etc
Implcit rules:
- Elements in the array can be any literal object
- Array can be empty, in which case the output is an empty array
- No nested arrays
--- E
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
--- D
- Inputs and outputs are arrays
--- A
- If array is empty,
  - Return an empty array
- Else,
  - Select the elements in the array with even indexes
  - Return the resultant array
=end

def oddities(array)
  return [] if array.empty?
  array.select.with_index { |_, index| index.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
