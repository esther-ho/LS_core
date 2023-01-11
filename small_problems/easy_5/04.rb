=begin
--- P
Input:
- A string of alphabetic characters or words
Output:
- Given string but with first and last characters of each word swapped
Explicit rules:
- String will always contain at least one word
- String has only alphabetic characters and spaces
Implicit rules:
Lettercase of the characters are preserved
--- E
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
--- D
- Split string into its separate words stored in an array
--- A
- Split the string into its separate words using ' ' as the delimiter
- Iterate through the words array
- For each iteration,
  - Assign the value of the first character to the last character
  - Assign the value of the last character to the first character
- Rejoin the elements in the array with ' ' to return the string
=end

def swap(string)
  words = string.split.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
