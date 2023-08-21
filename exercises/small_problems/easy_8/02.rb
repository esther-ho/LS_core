=begin
--- P
- Input: A string of letters
- Output: An array with all possible substrings that start at the first character
- Explicit rules:
  - The return value should be sorted in order from shortest to longest substring
- Implicit rules:
  - The given string contains at least one letters
  - All letters are in lowercase
  - All substrings are in the same case as the given string
  - The number of elements in the output array is equal to the length of the string
--- E
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
--- D
Input: string of lowercase letters
Output: an array of substrings, sorted from shortest to longest
--- A
- Find all possible substrings that start at the beginning of the string
  - Iterate through the string
  - Find the first substring of length 1
  - Increment the length of each substring by 1 until the length of the substring equals the length of the given string
- Add all possible substrings to an array in order from shortest to longest
  - Initialize an empty array called substrings
  - Add each substring to the `substrings` array
- Return the `substrings` array
=end

def leading_substrings(string)
  (1..string.size).each_with_object([]) do |length, substrings|
    substrings << string[0, length]
  end
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
