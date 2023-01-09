=begin
--- P
Input:
- A string of digits
- String can have a leading `+` or `-` sign
Output:
- If string has a leading `-` sign,
  - Return a negative number
- If string has a leading `+` sign or no sign,
  - Return a positive number
Implicit rules:
- Only valid number strings will be given
- No additional punctuation other than `+` and `-` will be given
--- E
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
--- D
- Hash of numeric string and their corresponding integers
--- A
- Initialize a variable `sign` with an empty string
- Check the first character of the string
- If the first character is not a digit,
  - Remove the first character and assign it to `sign`
- Call `string_to_integer` on the remaining characters
- If `sign` is equal to `-`
  - Multiply the resulting integer by one
- Else, return the resulting integer
=end
