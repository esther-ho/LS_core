=begin
--- P
Input(s):
- Two input array that can contain any object
Output(s):
- A new array that contains all elements from both arrays
- Elements must be ordered in alternation
Explicit rules:
Implicit rules:
- Alternation starts from the first input array, followed by the second
- Input arrays are of the same length
--- E
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
interleave([true, true], [false, false]) == [true, false, true, false]
interleave([nil, 1, 'a', :b], [true, 6.0, '3', :t]) == [nil, true, 1, 6.0, 'a', '3', :b, :t]
--- D
- Two unordered input arrays
- A single array with inputs from input array interleaved together
--- A
- Transform the input arrays so that the first elements are in a subarray, followed by the second elements, and so on
- Flatten the array
- Return the flattened array
=end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([true, true], [false, false]) == [true, false, true, false]
p interleave([nil, 1, 'a', :b], [true, 6.0, '3', :t]) == [nil, true, 1, 6.0, 'a', '3', :b, :t]
