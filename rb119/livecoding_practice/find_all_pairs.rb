=begin
You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

    Array can be empty or contain only one value; in this case return 0
    If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
    Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

[1, 2, 5, 6, 5, 2]  -->  2

...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4

...because there are 4 pairs: 2, 20, 6 and 2 (again)
=end

=begin
--- P

Count the number of pairs in the given array.

Input(s):
- Array of integers, or an empty array
Output(s):
- An integer
Explicit rules:
- Count each pair only once
- If the array is empty or contains only one value, return 0
Implicit rules:
- The array is not ordered
- Pairs do not have to be consecutive elements in the array
--- E
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
--- D
Input: an array
In-between: an array of unique integers
Output: an integer
--- A
- Return 0 if the array is empty or only contains 1 value
- Count all the pairs in the input array
  - Initialize a new array containing only the unique integers from the input array
  - Iterate through the array of unique integers
    - Convert each integer to its count in the input array
    - Divide the count by 2
    - Sum all counts
- Return the sum
=end

def pairs(numbers)
  return 0 if numbers.empty? || numbers.size == 1

  numbers.uniq.map { |n| numbers.count(n) / 2 }.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
