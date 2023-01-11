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
- Return an empty hash if the string is empty
- Split the string into individual words in an array, using space as a delimiter
- Iterate through the array
- For each iteration,
  - Return the length of the current string
- Count the number of occurences of each string size
=end
