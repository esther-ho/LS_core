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
- Check the first character of the string
- If the first character is not a digit,
  - Remove the first character and assign it to `sign`
- Call `string_to_integer` on the remaining characters
- If `sign` is equal to `-`
  - Negate the integer
- Else, return the resulting integer
=end

DIGITS = (('0'..'9').zip(0..9)).to_h

def string_to_integer(num_str)
  num_str.chars.inject(0) do |result, str|
    result * 10 + DIGITS[str]
  end
end

def string_to_signed_integer(num_str)
  sign = num_str.slice!(0) if %w(+ -).include?(num_str[0])
  integer = string_to_integer(num_str)
  sign == '-' ? -integer : integer
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

=begin
Further exploration - Refactored solution
def string_to_signed_integer(string)
  num_str = %w(- +).include?(string[0]) ? string[1..-1] : string
  integer = string_to_integer(num_str)
  string[0] == '-' ? -integer : integer
end
=end
