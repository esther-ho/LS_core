=begin
--- P
Input: a string of characters
Output: an array of all palindromic substrings, or an empty array

Explicit rules:
- Palindromic substrings are case-sensitive
- Palindromic substrings must consider all non-alphabetical characters
- Substrings should appear in the same sequence as they appear in the string
- Duplicate palindromes should be included
- All palindromes as two characters or longer

Implicit rules:
- If no palindromic substrings exist in the string, return an empty array
- Substrings can begin from any character in the string

--- E
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

--- D
Input: a string
In-between: an array of all substrings
Output: an array of palindromic strings

--- A
- Find all possible substrings of the given string
  - Find substrings that begin at the character from index 0 to the end of the string, and find all substrings of length 2 and greater
- Remove all non-palindromic substrings
  - Select all strings that are the same when read forwards and backwards
=end

def substrings(string)
  (0..string.size - 1).each_with_object([]) do |start_index, arr|
    2.upto(string[start_index..-1].size) do |length|
      arr << string[start_index, length]
    end
  end
end

def palindromes(string)
  substrings(string).select { |substring| substring == substring.reverse }
end

# Alternative:

# def palindromes(string)
#   (0..string.size - 1).each_with_object([]) do |start_index, arr|
#     2.upto(string[start_index..-1].size) do |length|
#       substring = string[start_index, length]
#       arr << substring if palindrome?(substring)
#     end
#   end
# end

# def palindrome?(string)
#   string == string.reverse
# end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further exploration

def nonsensitive_palindromes(string)
  (0..string.size - 1).each_with_object([]) do |start_index, arr|
    2.upto(string[start_index..-1].size) do |length|
      substring = string[start_index, length]
      arr << substring if nonsensitive_palindrome?(substring)
    end
  end
end

def nonsensitive_palindrome?(string)
  letters_only = string.gsub(/[^a-z]/i, '').downcase
  letters_only == letters_only.reverse && letters_only.size >= 2
end

p nonsensitive_palindromes('Abcba') == ["Abcba", "bcb"]
p nonsensitive_palindromes('Abc-Ba') == ["Abc-Ba", "bc-B"]
