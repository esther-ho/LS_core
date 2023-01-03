=begin
--- P
Input:
- A non-empty string
Output:
- One middle character if string length is odd
- Two middle characters if string length is even
Implicit rules:
- No leading or trailing whitespace
- Characters can be non-alphanumeric
--- E
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
--- D

--- A
- Find the length of the string
- Assign middle to be (string length) divided by two rounded down
- If the string length is odd,
  - Return the character at place (middle)
- Else, if string length is even,
  - Return the characters at place (middle) and (middle + 1)
=end
