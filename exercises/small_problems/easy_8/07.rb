=begin
--- P
Input: a string of characters, or an empty string
Output: a string of characters where only consonants are doubled, or an empty string

Explicit rules:
- Only consonants should be doubled

Implicit rules:
- All consonants, regardless of case, should be doubled
- Consonants should be doubled in place
- Doubled consonants should retain their letter case
- Empty strings should return an empty string

--- E
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

--- D
Input: a string of characters
Output: a string of characters where only consonants should be doubled

--- A
- Find all characters in the string that are consonants
  - Exclude vowels
  - Exclude non-alphabetical characters
- Double each consonant
  - Replace each consonant with two repeated consonants
- Return the string with consonants doubled
=end

def double_consonants(string)
  string.gsub(/[a-z&&[^aeiou]]/i) { |char| char * 2 }
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
