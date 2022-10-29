=begin
Problem:
Write a method that takes one argument (a string) and returns a new string with the words in reverse order.

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

----- P
Input: A string
Output: The input string modified so that the words are in reverse order e.g. the first word becomes the last word and vice versa

Implicit rules:
- The words should maintain their letter case in their new position
- Strings with multiple spaces will return empty strings
- The method can mutate the input

----- E
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

----- D
Use an array to store the words and change their order

----- A
- Divide the string into its individual words stored in an array
- Reverse the order of the words stored in the array
- Join the individual words into a string
- Return the new string

=end

def reverse_sentence(sentence)
  sentence.split(' ').reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
