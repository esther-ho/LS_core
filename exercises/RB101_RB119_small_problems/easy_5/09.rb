=begin
--- P
Input:
- A string of both alphabetic and non-alphabetic characters
Output:
- A new string that contains characters from the original string but,
  - Characters epeated consecutively are condensed into a single character.
Explicit rules:
- `Stringpsqueeze` & `Stringpsqueeze!` cannot be used.
Implicit rules:
- Lettercase of the characters is preserved.
- Position of the characters in the string is preserved.
- Multiple non-alphabetic characters are also condensed.
--- E
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == '
--- D
- Create an array containing the characters in the given string
--- A
- Split the string into an array containing its characters
- Assign the array to the variable `clean`
- Iterate through the array
- For each iteration,
  - If it is not the first character and,
  - The previous character matches the current character,
    - Delete the current character
- Join the `clean` array without spaces to return the modified string
=end

def crunch(string)
  string.chars.delete_if.with_index do |char, i|
    char == string[i - 1] if i != 0
  end.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

=begin
Further exploration:
- When using `String#each_char` or `String#chars`, you can:
  - Use `Enumerable#with_index` or `Enumerable#each_with_index`
    - Allows you to reference index

- Modified method using `String#each_char`
def crunch(string)
  crunch_text = ''
  string.each_char.with_index do |text, index|
    crunch_text << text unless char = string[index + 1]
  end
  crunch_text
end

- Method using regular expressions
def crunch(string)
  string.scan(/(.)\1*/).join
end
=end
