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
  array.select.with_index { |_, index| index.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

def evens(array)
  array.delete_if { |element| array.index(element).even? }
end

def evens_2(array)
  evens = []
  array.each_with_index { |element, index| evens << element if index.odd? }
  evens
end

p evens([2, 3, 4, 5, 6]) == [3, 5]
p evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evens(['abc', 'def']) == ['def']
p evens([123]) == []
p evens([]) == []
p evens([1, 2, 3, 4, 1]) == [2, 4]

p evens_2([2, 3, 4, 5, 6]) == [3, 5]
p evens_2([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evens_2(['abc', 'def']) == ['def']
p evens_2([123]) == []
p evens_2([]) == []
p evens_2([1, 2, 3, 4, 1]) == [2, 4]
