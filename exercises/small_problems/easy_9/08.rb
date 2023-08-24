=begin
Input: a nested array with subarrays where,
- each subarray contains two elements:
  - a string
  - an integer
Output: an array of strings where,
- each string is repeated as many times as the integer in the subarray

Explicit rules:
- the input always has a string and an integer
- the output array has a repeated number of strings based on the integer

Implicit rules:
- the output array is not nested
- the output array only has strings
- the lettercase of the string is not changed in the output

--- E
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

--- D
Input: a nested array with subarrays containing a string and an integer
In-between: a nested array with subarray containing the repeated number of strings
Output: an array of strings

--- A
- Multiply each string (fruit) by its correct number
- Return the array with the correct number of strings
=end

def buy_fruit(fruits)
  fruits.flat_map { |fruit, count| [fruit] * count }
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
