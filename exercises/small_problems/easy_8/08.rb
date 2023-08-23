=begin
--- P
Input: a string of characters
Output: a string of characters with words in reverse order, or an empty string

Explicit rules:
- The new string is in reverse order

Implicit rules:
- The lettercase for each character does not change
- Return an empty string if the string contains only whitespace

--- E
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

--- D
- Input: a string
- In-between: an array of words delimited by spaces
- Output: a string in reverse

--- A
- Convert the string into a collection of words that are separated by spaces in the given string
- Reverse the order of the words within the collection
- Join the words in the collection with spaces to form the new string
=end

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

# Alternative

# def reverse_sentence(sentence)
#   sentence.split.each_with_object([]) do |word, arr|
#     arr.unshift(word)
#   end.join(' ')
# end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
