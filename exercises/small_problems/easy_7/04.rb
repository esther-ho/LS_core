=begin
--- P
Input(s):
- A string of letters and spaces
Output(s):
- A new string which is the original string modified such that the case of every letter is swapped:
  - Lowercase letters are swapped for their uppercase version and vice-versa
Explicit rules:
- Non-letter characters should remain unchanged
Implicit rules:
- The position of the characters should remain as per the original string
--- E
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
swapcase('123') == '123'
swapcase('AbCCCd123') == 'aBcccD123'
--- D
- Array of characters in the string
--- A
- Convert the string to an array of all its individual characters
- Iterate through the array
- For each iteration
  - If the case of the current character is lowercase
    - Replace with its uppercase version
  - Else, if the case of the current character is uppercase
    - Replace with its lowercase version
  - Else, return the original character
- Join the elements in the array to form a string
- Return the new string
=end

def swapcase(string)
  string.chars.map do |char|
    char unless char =~ /[a-z]/i
    char =~ /[a-z]/ ? char.upcase : char.downcase
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
p swapcase('123') == '123'
p swapcase('AbCCCd123') == 'aBcccD123'
