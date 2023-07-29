=begin
--- P
Input(s):
- A single string containing letters and punctuation
Output(s):
- A new string which is the original string but with the first letter of each word capitalized
Explicit rules:
- String contains words of any sequence with non-blank characters
Implicit rules:
- If words do not begin with a letter, the word is not capitalized
--- E
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
--- D
- Array of words to iterate over
--- A
- Split the string into an array containing its individual words as elements
- Iterate over the array
- For each iteration
  - Capitalize the first letter of the word
- Join all the string elements into the transformed array into a new string
- Return the new string
=end

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

word_cap('four score and seven') #== 'Four Score And Seven'
word_cap('the javaScript language') #== 'The Javascript Language'
word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
