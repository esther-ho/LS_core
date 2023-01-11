=begin
--- P
Input:
- A string of characters consisting of:
  - Lowercase alphabetic characters
  - Non-alphabetic characters
Output:
- Given string with non-alphabetic characters replaced by spaces
- Consecutive spaces replaced by one space
--- E
cleanup("---what's my +*& line?") == ' what s my line '
--- D

--- A
- Replace all non-alphabetic characters with spaces
- Replace sets of multiple consecutive spaces with a single space
=end
