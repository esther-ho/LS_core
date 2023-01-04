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
