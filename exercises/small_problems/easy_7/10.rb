=begin
--- P
Input(s):
- A string
Output(s):
- The second-last word in the string
Explicit rules:
- Words are sequences of characters with non-blank characters
- String will always contain at least two words
Implicit rules:
- Returned word should have the same lettercase as the original word
--- E
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
--- D
- Array of words
--- A
- Split string into an array of words
- Return the second-last element in the array
=end

def penultimate(str)
  str.split[-2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

# Further exploration

def middle_word(str)
  # Edge cases:
  # No words or only one word
  # - Return empty string if no words
  # - Return empty string if only whitespace  
  # - Return word if only one word
  # Even number of words
  # - Return the word after the middle point

 str.strip.empty? ? '' : str.split[(str.split.size) / 2]
end

middle_word('last word') == 'word'
middle_word('last') == 'last'
middle_word('') == ''
middle_word('   ') == ''
middle_word('last word again') == 'word'
