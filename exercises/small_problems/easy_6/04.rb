=begin
--- P
Input:
- An array of elements
  - Can be string, numbers etc
Output:
- Mutated original array such that:
  - The array is completely reversed
  - E.g first element becomes the last element and vice versa
Explicit rules:
- `Array#reverse` and `Array#reverse!` cannot be used
Implicit rules:
- The elements themselves are not modified
- e.g. reverse!(['abc']) == ['abc']
--- E
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
--- D
- The original input is given as an array of elements
- The output is the mutated version of the original array
--- A
- Iterate through the original array
- Assign start as '0'
- While the value of `start` is less than the mid-point of the array
- For each iteration,
  - Swap the elements at indexes `start` and index[-start - 1]
    - e.g. index[0] and index[-1], index[1] and index[-2] etc
  - Increment `start` by 1
- Return the modified array
=end

# Note that this method has both a side-effect and return value
# Seen as bad practice; you want it to have either
def reverse!(array)
  start = 0
  while start < (array.size / 2)
    array[start], array[-start - 1] = array[-start - 1], array[start]
    start += 1
  end
  array
end

list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
