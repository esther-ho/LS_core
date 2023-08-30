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

# Further exploration

def word_to_digit(sentence)
  words = %w(zero one two three four five six seven eight nine)
  digits = ('0'..'9').to_a
  digits_hash = words.zip(digits).to_h
  match = Regexp.union(digits_hash.keys).source
  match_regex = /\b(#{match})\b(\s(?=#{match}))*/i

  new_sentence = sentence.gsub(match_regex) do |word|
    word[-1] == ' ' ? digits_hash[word.downcase[0..-2]] : digits_hash[word.downcase]
  end

  new_sentence.gsub(/(\d{3}) *(\d{3}) *(\d{4})/, '(\1) \2-\3')
end

p word_to_digit('Can you say one two three? What about 4 5 6?') == 'Can you say 123? What about 4 5 6?'
p word_to_digit('Please call one two three four five six 7890.') == 'Please call (123) 456-7890.'
puts word_to_digit('Please call me at four one six five five five one two three four between ' \
                    'eight AM and six PM. Thanks.') == 'Please call me at (416) 555-1234 between 8 AM and 6 PM. Thanks.'

puts word_to_digit('Please call me at FIVE FIVE FIVE One two three Four five six seven. ' \
                    'Thanks, Agent 5 2 0') == 'Please call me at (555) 123-4567. Thanks, Agent 5 2 0'
puts word_to_digit('one Two THree FOUr FIVE SIX sEVEN eiGHT ninE zero hi zero hi one two three 1 2 3') ==
     '(123) 456-7890 hi 0 hi 123 1 2 3'
puts word_to_digit('Please call me at four one six five five five one two three four between ' \
                    'eight AM and six PM. Take none of the freight eighty. Thanks.') ==
     'Please call me at (416) 555-1234 between 8 AM and 6 PM. Take none of the freight eighty. Thanks.'
