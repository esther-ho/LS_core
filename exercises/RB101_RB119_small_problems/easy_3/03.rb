=begin
--- P
Inputs:
- User input of a word or a phrase
Outputs:
- Number of characters in the input

Implicit rules:
- Input consists of only alphabetical letters and punctuation
- Punctuation is counted as characters
- Spaces are not counted as characters
- No validation of input needed
--- E
Please write word or multiple words: walk, don't run
There are 13 characters in "walk, don't run".
--- D

--- A
- Print the prompt for the user to enter a word or phrase
- Store the input
- Delete all spaces
- Find the length of the remaining string
- Print the number of characters in the word or phrase
=end

print "Please write word or multiple words: "
words = gets.chomp
char_count = words.delete(' ').size
puts "There are #{char_count} characters in \"#{words}\"."
