=begin
--- P
Input(s):
- Two arrays
Output(s):
- Array that contains all values from the argument arrays
Explicit rules:
- No duplicate values
Implicit rules:
- Arrays can contain any type of object
--- E
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
merge([], [1, 1, 3]) == [1, 3]
merge([], []) == []
merge(['a', :snap], ['ab', 'a', 1, 5]) == ['a', :snap, 'ab', 1, 5]
--- D
- Two input arrays
- One output array
--- A
- Concatenate two arrays
- Remove duplicate values
=end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge([], [1, 1, 3]) == [1, 3]
p merge([], []) == []
p merge(['a', :snap], ['ab', 'a', 1, 5]) == ['a', :snap, 'ab', 1, 5]
