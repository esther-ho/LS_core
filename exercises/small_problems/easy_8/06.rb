=begin
--- P
Input: a string of characters
Output: a string of characters with every character doubled, or an empty string

Explicit rules:
- Every character in the given string is doubled in the new string

Implicit rules:
- Each character is doubled in place
- Characters retain their case (e.g. lowercase characters remain lowercase)
- All non-alphabetical characters are also doubled
- Empty strings return an empty string

--- E
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

--- D
Input: a string of characters
In-between: an array of characters in the string
Output: a string with characters doubled

--- A
- Split the string into each individual characters
- Multiply each character twice
- Return the new string with characters doubled
=end

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

# Alternative

# def repeater(string)
#   string.gsub(/./) { |char| char * 2 }
# end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
