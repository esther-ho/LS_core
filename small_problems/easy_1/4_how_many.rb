=begin
Problem:
Write a method that counts the number of occurrences of each element in a given array.

----- P
Input:
- An unsorted array of string
Output:
- Every unique element in the array printed on a new line with the number of times it appears in the array e.g. car => 4

Implicit rules:
- Similar words with different letter case are considered unique words
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
- Array of unique values from the reference array

----- A
- Filter the reference array to its unique words
- Iterate through the array containing unique words
  - Count the number of times each unique word appears in the reference array
  - Print the result in a new line for each unique word in the format 'word => count'

=end

def count_occurrences(array)
  array.uniq.each do |word|
    puts "#{word} => #{array.count(word)}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
