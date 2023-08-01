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
