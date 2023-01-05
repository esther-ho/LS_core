=begin
--- P
Input:
- A string of characters
Output:
- Return `true` if all alphabetic characters are uppercase
- Return `false` otherwise
Explicit rules:
- Ignore all non-alphabetic characters
Implicit rules:
- Empty strings should return `true`
- String containing only non-alphabetic characters should return `true`
--- E
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
--- D

--- A
- Remove all non-alphabetic characters from the string
- Return `true` if string is empty
- Check if string is equal to the its uppercase version
- If they are the same,
  - Return `true`
- Else, if they are not the same,
  - Return `false`
=end
