=begin
--- P
Inputs:
- A string containing multiple characters.
Outputs:
- Return true if string is a palindrome
  - String is the same when read from the front or back.
- Return false otherwise.
Implicit rules:
- If string contains alphabetical characters,
  - The case must be the same when read from front or back
- If the string contains punctuation or spaces,
  - They should be in the same place in the string when read from front/back
--- E
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
--- D

--- A
- Reverse the original string
- If the original string matches the reversed string,
  - Return true
- Else, return false.
=end

def palindrome?(string)
  string.reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# `arr.reverse == arr` for array palindromes
# `item.reverse == item` for array or string palindromes

# Coding palindrome method from scratch
def all_palindrome?(item)
  item = item.chars unless item.is_a?(Array)
  left, right = 0, -1
  while left < item.size / 2
    return false if item[left] != item[right]
    left += 1
    right -= 1
  end
  true
end

p all_palindrome?([1, 2, 1])
p all_palindrome?('madam') == true
p all_palindrome?('Madam') == false          # (case matters)
p all_palindrome?("madam i'm adam") == false # (all characters matter)
p all_palindrome?('356653') == true
