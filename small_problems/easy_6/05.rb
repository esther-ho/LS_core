=begin
--- P
Input:
- An array of elements
  - Elements can be any ruby object
Output:
- A new array where:
  - The elements are in a reverse order from the input array
Explicit rules:
- The input array should not be modified
- Do not use `Array#reverse` and `Array#reverse!`
- Do not use previously written code
Implicit rules:
- The elements themselves should not be modified
- The new array should have the same # of elements as input
--- E
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
--- D
- The input will be an array of elements
- The output is a new array of the same elements as input
--- A
- Initialize an empty array
- Iterate through the input array
- For each iteration,
  - Prepend the element at the iteration to the new array
- Return the new array
=end
