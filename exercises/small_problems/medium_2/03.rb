=begin
--- P
input: a string of characters
output: a hash with symbols as keys and floats as values 
- percentage of lowercase
- percentage of uppercase
- percentage of neither

Explicit rules:
- String will always contain one character

Implicit rules:
- spaces count as characters

--- E
'abCdef 123'
abdef -> lowercase
C -> uppercase
 123 -> neither

--- D
Input: string
Output: hash

--- A

- Count the numbers of characters that fall in each category (lowercase, uppercase, neither)
  - Create a new hash
    - symbols as keys
    - regex as values
  - Find the characters that match the respective regex
- Find the percentage of each category
  - Divide count of each category by total string count
  - Multiply by 100
- Assign each value to its respective key in the hash
- Return the hash
=end

def letter_percentages(string)
  hash = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }

  hash.transform_values do |regex|
    (string.count(regex) * 100.0 / string.size).round(1)
  end
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == { lowercase: 66.7, uppercase: 33.3, neither: 0.0 }
