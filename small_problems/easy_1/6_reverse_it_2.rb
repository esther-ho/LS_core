=begin
Problem
- Write a method that:
  - Takes one argument (a string containing one or more words)
  - Returns the given string with words that contain five or more characters reversed
- Each string will consist of only letters and spaces
- Spaces should be included only when more than one word is present

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

----- P
Input:
- A sentence containing one or more words
Output:
- A sentence with words having 5 or more characters reversed
Implicit rules:
- The letter case of each word is maintained even if they are reversed
- The word order remains the same as the given sentence
- The sentence can be mutated

----- E
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

----- D
Use an array to store the individual words in the sentence
Use an array to store the individual letters in each word and to change their position

----- A
- Split the given sentence into its individual words stored in an array
- Iterate through the array of words
- For each iteration, find the length of each word
  - If the word is 5 characters or longer,
    - Reverse the order of the word
  - Otherwise, if the word is shorter than 5 characters
    - Return the current word
- Return the new sentence

=end

def reverse_words(sentence)
  words = sentence.split.map! do |word|
    if word.length >= 5
      word.chars.reverse.join
    else
      word
    end
  end
  
  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
