=begin
Problem:
Write a method that counts the number of occurrences of each element in a given array.

----- P
Input:
- An unsorted array of strings
Output:
- Every unique word in the array printed on a new line with the number of times it appears in the array e.g. 'car => 4'

Explicit rules:
- The same word but with a different letter case is considered a separate word

Implicit rules:
- The letter case of each word should not change
- The output is not ordered
- The input can be mutated
- The return value isn't important

----- E
count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

----- D
- The default reference collection is an array
- Hash where each key is a unique element and its pair is the number of occurences in the reference array

----- A
- Create an empty hash
- Iterate through the reference array
  - If the current word is an existing key in the hash
    - Increment the value by '1'
  - Otherwise, if the current word does not exist as a key in the hash,
    - Add it to the hash as a new key
    - Assign the value of '1' to the key
- Print the hash key-value pair in the format 'key => value'

=end

def count_occurrences(array)
  hash = {}

  array.each do |word|
    if hash.include?(word)
      hash[word] += 1
    else
      hash[word] = 1
    end
  end

  hash.each { |key, value| puts "#{key} => #{value}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
