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
  - Return the characters at place (middle - 1) and (middle)
=end

def center_of(string)
  middle = (string.size / 2).floor
  if string.size.odd?
    string[middle]
  else
    string[middle - 1] + string[middle]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

=begin
# Alternatives
def center_of(string)
  string[((string.size - 1) / 2)..(string.size /2)]
end

def center_of(string)
  mid, remainder = (string.size - 1).divmod(2)
  string[mid, remainder + 1]
end

Explanation:
- String of length 4 has middle characters at index 1 and 2
  - (string length - 1) / 2 => 1 (index 1)
  - string length / 2 => 2 (index 2)
  - (string length - 1).divmod(2) => 1 with remainder 1
- String of length 3 has a middle character at index 1
  - (string length - 1) / 2 => 1 (index 1)
  - string length / 2 => 1.5 (still index 1 when using `String#[]`)
  - (string length - 1).divmod(2) => 1 with remainder 0
=end
