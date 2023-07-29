=begin
--- P
Input(s):
- An input array containing integers
Output(s):
- Two subarrays in a nested array, where
  - First subarray contains first half of original array based on their position
  - Second subarray contains second half of original array based on their position
Explicit rules:
- The middle element should be placed in the first subarray if the number of elements are odd
Implicit rules:
- Original array can be empty or contain integers
- Return two empty subarrays if input array is empty
--- E
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
--- D
- Input array
- Two subarrays within a nested array
--- A
- If the current number is at the middle element or before the middle element in the input array
  - Add number to the first subarray
- Else,
  - Add number to the second subarray
=end

def halvsies(num_arr)
  num_arr.partition.with_index { |_, i| i < num_arr.size / 2.0 }
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
