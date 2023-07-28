=begin
--- P
Input:
- A string of words separated by spaces
Output:
- A hash where:
  - Keys are sizes of words in the given string
  - Values are counts of with the same size
Explicit rules:
- Non-alphabetic characters are excluded
Implicit rules:
- Words are separated by only a single space
- String size is calculated alphabetic character substrings
  - Substrings are separated by spaces
  - Non-alphabetic characters are ignored
--- E
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
--- D
- Split the string into its substrings in an array using space as the delimiter
- Use a hash where:
  - Keys are the different word lengths in the string
  - Values are the number of the given word length in the string
--- A
- Initialize an empty hash with a default value of 0
- Convert all alphabetic characters to lowercase
- Remove all non-alphabetic characters, except for spaces
- Split the string into its substrings in an array using space as the delimiter
- Iterate through the array
- For each iteration,
  - Find the current word length
  - Search the hash for the value using current word length as the key
  - Increment the value by 1
- Return the hash
=end

def word_sizes(string)
  count = Hash.new(0)
  string.delete('^a-zA-Z', '^ ').split.each do |word|
    count[word.size] += 1
  end
  count
end

=begin
Alternatives:
def word_sizes(string)
  string.delete('^a-zA-Z', '^ ').split.map(&:size).tally
end

# /i modifier ignores case
def word_sizes(string)
  string.gsub(/[^a-z ]+/i, '').split.map(&:size).tally
end

# Delete non-alphabetic characters after splitting
def word_size(string)
  count = Hash.new(0)
  string.split.each do |word|
    clean_word = word.delete('^a-zA-Z')
    count[clean_word] += 1
  end
  count
end
=end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
