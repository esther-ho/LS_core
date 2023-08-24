=begin
--- P
Input: an array of objects
Output: an array with every other element (1st, 3rd, 5th...places -> index 0, 2, 4...)

Explicit rules:
- The output array should contains only elements at every other place, starting at the 1st place (index 0)

Implicit rules:
- Elements in the input and output array are not ordered
- If the input array is empty, the output array will be empty

--- E
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

--- D
Input: an array of objects
Output: an array of objects from every other place, starting from index 0
=end

def oddities(array)
  array.select.with_index { |_, i| i.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
