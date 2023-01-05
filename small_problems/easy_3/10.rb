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
- Check if string is equal to the its uppercase version
- If they are the same,
  - Return `true`
- Else, if they are not the same,
  - Return `false`
=end

def uppercase?(string)
  # string = string.delete "^a-zA-Z" => redundant
  string == string.upcase
  # Alternative:
  # `string.count "A-Z" == string.size`
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

=begin
Further exploration:
If `uppercase?` were to return `false` for empty strings,
- The user is unable to tell if the method returns `false` because:
  - Not all alphabetic characters are uppercase, or
  - No alphabetic characters are present
Similarly, if `uppercase?` returned `true` for empty strings,
- The user is unable to tell if:
  - All alphabetic characters are uppercase, or
  - No alphabetic characters are present
Ways to distinguish if the return value is due to empty string or otherwise
1. Check if string contains alphabetic characters before `uppercase?`
  - Eliminate strings without alphabetic characters
  - Check for uppercase after elimination
2. Both `uppercase?` and `lowercase?` should return `true` for empty strings
  - Empty strings include strings with only non-alphabetic characters
  - If a string returns `true` for both methods,
    - We can conclude it does not contain alphabetic characters
3. Separate non-boolean (`true`/`false`) value if string is either:
  - Empty or only contains non-alphabetic characters
=end
