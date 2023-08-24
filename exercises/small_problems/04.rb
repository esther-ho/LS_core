=begin
--- P
Input: a string containing characters OR an empty string
Output: an empty array OR an array of strings where:
- each string contains a substring from the input string
- with a space and word length appended at the end

Explicit rules:
- The words in the string are separated by spaces

Implicit rules:
- A word may contain letters or non-space characters
- Elements in the array are ordered in order of appearance in the given string

--- E
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

--- D
Input: a string
In-between: an array of words
Output: an array of strings with word length appended

'hello there!' -> ['hello', 'there!'] -> ['hello 5', 'there! 6']
'' -> []

--- A
- Split string into its words separated by spaces
- Find the length of each word
- Modify each word to contain its word length appended
  - Iterate through all the substrings
  - Interpolate a space and the length of each substring to the end of each substring
=end

def word_lengths(sentence)
  sentence.split.map { |word| word + ' ' + word.size.to_s }
end

# Alternative:

# def word_lengths(sentence)
#   sentence.scan(/\S+/).map { |word| "#{word} #{word.size}" }
# end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
