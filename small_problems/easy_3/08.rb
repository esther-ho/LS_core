=begin
--- P
Input:
- A string
Output:
- Return `true` if string is a palindrome
- Return `false` if string is not a palindrome
- Ignore case differences and non-alphanumeric characters
--- E
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
--- D

--- A
- Replace non-alphanumeric characters with an empty string in original string
- Convert all characters in the original string to lowercase
- Reverse the string
- Check if the reversed string matches the original string
- If they match,
  - return `true`
- Else, if they don't match,
  - Return `false`
=end

def real_palindrome?(string)
  modified_string = string.gsub(/\W/, '').downcase
  modified_string.reverse == modified_string
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
