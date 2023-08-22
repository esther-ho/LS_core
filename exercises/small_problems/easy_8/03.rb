=begin
--- P
Input: a string of letters
Output: an array containing all possible substrings of the given string

Explicit rules:
- The substrings in the output array should be sorted from shortest to longest
- All substrings that start from index 0 come first, followed by all substrings that start from index 1, and so on

Implicit rules:
- The string only contains lowercase letters
- All substrings have the same case as the given string

--- E
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

--- D
Input: a string
Output: an array of substrings

'ab' -> ['a', 'ab', 'ab', 'b']

--- A
- Find all substrings starting at each index
  - Find the first substring at index i of length 1
  - Find the size of the largest substring from index i
  - Increment the length by 1 until the length of the substring equals to length of the largest substring
- Add each substring to an array
=end

def substrings(string)
  (0..string.size - 1).each_with_object([]) do |start_index, arr|
    1.upto(string[start_index..-1].size) do |length|
      arr << string[start_index, length]
    end
  end
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
