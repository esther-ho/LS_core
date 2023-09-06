# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

=begin
--- P
Input: a string containing letters and spaces
Output: a string - a character that is a lowercase letter or space

Rules:
- Return the character that appears least often
- Return the first occuring letter if multiple characters have equal lowest number of occurences
- Lowercase and uppercase characters count as the same character
- Output letter can be a letter or space
- Return lowercase character

--- E
"Hello World"
1 -> H, e, W, r, l, d -> H appears first

"Happy birthday!"
1 -> ' ', b, i... -> ' ' appears first

--- D
Input: a string
In-between: an array of unique characters
Output: a string

--- A
- Initialize a hash
- Convert all characters in the sentence to lowercase
- Find all unique characters and their counts in the sentence
  - Assign each unique character as the key
  - Assign its count as the value
- Return the first occuring character with the lowest count
=end

def least_common_char(sentence)
  char_count = sentence.downcase.chars.tally
  char_count.key(char_count.values.min)
end

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".
