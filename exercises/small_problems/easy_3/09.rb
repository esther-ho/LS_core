=begin
--- P
Input:
- A positive integer
Output:
- Return `true` if integer is palindromic
- Return `false` if integer is not palindromic
  - Palindrome: number reads the same forwards and backwards
Implicit rules:
- Only whole numbers are given, no floats
- Only positive numbers are given
- Single digit numbers will always return `true`
--- E
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
--- D

--- A
- Convert the number into a string
- Reverse the string
- Convert the string back to an integer
- Compare the reversed integer to the original integer
- If the reversed integer and original match,
  - Return `true`
- Else, if they don't match,
  - Return `false`
=end

def palindromic_number?(number)
  number.to_s.reverse.to_i == number
  # alternative: number.digits.join.to_i == number
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

=begin
- If a number has leading zeros,
  - Ruby treats the number as an octal (base 8) number.
- Converting the number to a string converts it to its decimal (base 10) number
  - E.g. `0020.to_s` => "16"
- If converted to a string with place-value representation of base 8,
  - You retain the number "20" but lose the leading zeros
- You can determine if a *string* of numbers with leading 0s is a palindrome
  - But not a number with leading 0s since leading 0s are removed
=end
