# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

=begin
--- P
Input(s):
- A string of only lowercase letters
Output(s):
- The longest substring in alphabetical order
Explicit rules:
- Input string will only have lowercase letters
- Input string will be at least one letter long
- Return first longest substring if there are multiple
Implicit rules:
- Substrings can range from 1 character long to the entire input string
- Substrings can contain repeated characters as long as they are in order
--- E
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
--- D
- Input: string
- In-between:
  - Array of characters in the string
  - Reference array with all possible substrings
- Output: string
--- A
- Find all possible substring of the input string
  - Initialize a 'substrings' reference array
  - Split the input string into an array of its characters
  - Iterate through the array
  - For each iteration,
    - Find all substrings for each character by incrementing the index
    - Add substrings in alphabetical order to the 'substrings' array
- Find the longest substrings that are in alphabetical order, and return the first one
  - Find the lengths of all substrings
=end

def sorted_substrings(string, arr)
  0.upto(string.size) do |i|
    1.upto(string.size) do |length|
      substring = string[i, length]
      break if substring.size < length

      arr << substring if substring.chars == substring.chars.sort
    end
  end
end

def longest(string)
  substrings = []
  sorted_substrings(string, substrings)

  max_length = substrings.map(&:size).max
  substrings.select { |substring| substring.size == max_length }.first
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

