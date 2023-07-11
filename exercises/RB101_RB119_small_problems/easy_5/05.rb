=begin
--- P
Input:
- A string of characters consisting of:
  - Lowercase alphabetic characters
  - Non-alphabetic characters
Output:
- Given string with non-alphabetic characters replaced by spaces
- Consecutive spaces replaced by one space
Implicit rules:
- Numbers are not included in the string
- Original string does not have to be modified
--- E
cleanup("---what's my +*& line?") == ' what s my line '
--- D

--- A
- Replace all non-alphabetic characters with spaces
- Replace sets of multiple consecutive spaces with a single space
=end

def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end

# Alternative: `string.gsub(/[^a-z]+, ' ')`
# Replaces multiple non-alphabetic characters with one space

p cleanup("---what's my +*& line?") == ' what s my line '
