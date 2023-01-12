=begin
--- P
Input:
- A string of words separated by spaces
Output:
- A hash where:
  - Keys are the length of the word
  - Values are the number of word of given length in the string
Implicit rules:
- Words are substrings separated by spaces
- Words can contain both alphabetic and non-alphabetic characters
- An empty string results in an empty hash being returned
--- E
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') ==
  { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
--- D
- Hash to store the sizes of words in teh string and counts of each size
- Split the string into individual words in an array, using space as a delimiter
--- A
- Split the string into individual words in an array, using space as a delimiter
- Iterate through the array
- For each iteration,
  - Return the length of the current string
- Count the number of occurences of each string size
=end

def word_sizes(string)
  string.split.map(&:size).tally
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') ==
  { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
# An empty array will return an empty hash when calling `#tally`

=begin
Alternative using Hash:
def word_size(string)
  count = Hash.new(0)
  string.split.each { |word| count[word.size] += 1 }
  count
end

- Sending an argument to `Hash::new` sets it as the default value
  - It forces references to non-existing keys to return the default value
  - e.g. `Hash.new(0)` sets all keys to have the default value of 0 (return 0)
  - We need to set the default to 0 since `1` cannot be added to `nil`
- `Hash#default=` can also be used to set the default value of keys
=end
