# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

=begin
--- P
Input: an array of numbers
Output: an array of two numbers

Rules:
- The numbers that are returned are closest in value
- Only one pair will have the smallest difference
- The array will have at least 2 values
- Pairs do not have to be consecutive

--- E
[5, 25, 15, 11, 20]
15 - 11 -> 4

[19, 25, 32, 4, 27, 16]
27 - 25 -> 2

[12, 7, 17]
12 - 7 -> 5

--- D
Input: an array of numbers
In-between: a hash, where
- each pair is a key
- the difference between each pair is the value
Output: a pair of numbers

--- A
- Initialize an empty hash
- Find the difference between all possible pairs
  - Iterate through the array and find all possible pairs
    - Add each pair to the hash as a key
    - Assign the difference between the pair of numbers as its value
- Return the pair with the smallest difference
=end

def closest_numbers(numbers)
  pairs = {}
  numbers.combination(2) do |pair|
    pairs[pair] = pair.reduce(:-).abs
  end

  pairs.key(pairs.values.min)
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".
