=begin
--- P
Input: a string of one or more words
Output: a string with words containing 5 or more characters reversed

Explicit rules:
- Only words with more than 4 characters are reversed
- Strings will only contain letters and spaces
- Only include spaces if more than one word is present

Implicit rules:
- Words are groups of letters separated by spaces
- Lettercase of reversed words should not be changed
- Words are reversed in place i.e. the position of the word should not change

--- E
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

--- D
- Input: a string
- In-between: an array of words in the string
- Output: a string with some words reversed in place

--- A
- Create a collection of words within the string
- Check each word in the collection
- If the word is longer than 4 characters, replace the word with its reversed version
- Join all the words in the collection to get the new string
=end

def reverse_words(sentence)
  sentence.split.map { |word| word.size > 4 ? word.reverse : word }.join(' ')
end

# Alternative
# def reverse_words(sentence)
#   sentence.gsub(/\S{5,}/) { |word| word.reverse }
# end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
