=begin
--- P
Input: a sentence - string object
Output: the input sentence except,
- words that represent numbers are converted to their number strings

Explicit rules:
- The word strings are replaced with their string digits in the new string

Implicit rules:
- The rest of the sentence remains unmodified

--- E
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

--- D
Input: a string
Additional: a hash where the key is the word string and the value is the digit string
Output: a modified string

--- A
- Create a collection of word strings and their corresponding digit strings
  - Initialize a hash where word strings are keys and digit strings are values
- Replace all word strings with their digit strings
  - Split the sentence into its individual words
  - Iterate through the words
    - Replace the word string with the digit string
=end

def word_to_digit(sentence)
  words = %w(zero one two three four five six seven eight nine)
  digits = ('0'..'9').to_a
  digits_hash = words.zip(digits).to_h

  sentence.gsub(Regexp.union(digits_hash.keys)) { |word| digits_hash[word] }
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


