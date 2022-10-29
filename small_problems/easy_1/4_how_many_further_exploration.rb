=begin
Problem:
Write a method that counts the number of occurrences of each element in a given array.
Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV"

----- P
Input:
- An unsorted array of strings
Output:
- Every unique word in the array printed on a new line with the number of times it appears in the array e.g. 'car => 4'

Explicit rules:
- Words spelled the same with different letter case are considered the same word

Implicit rules:
- The output is not ordered
- The input can be mutated
- The return value isn't important

Question for clarification:
- Should the letter case of each word that is printed be retained? 

----- E
count_occurrences(vehicles)
# car => 4
# truck => 3
# suv => 2
# motorcycle => 2

----- D
- The default reference collection is an array
- Hash where each key is a unique element and its pair is the number of occurences in the reference array

----- A
- Assume letter case of the word printed is not important
- Create an empty hash
- Iterate through the reference array
- For each iteration,
  - Convert the word to lower case
  - If the word exists as a key in the hash
    - Increment the value by '1'
  - Otherwise, if the word doesn't exist as a key in the hash
    - Add it to the hash as a new key
    - Assign it a value of '1'
- Iterate through the hash
- For each iteration,
  - Print the key-value pair in the form 'key => value'

=end

def count_occurrences(array)
  hash = {}

  array.each do |word|
    word.downcase!

    if hash.include?(word)
      hash[word] += 1
    else
      hash[word] = 1
    end
  end

  hash.each { |key, value| puts "#{key} => #{value}"}
end


vehicles = [
  'car', 'car', 'truck', 'Car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)
