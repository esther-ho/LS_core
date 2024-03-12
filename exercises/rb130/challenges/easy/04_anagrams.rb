=begin
--- P
Input: a string and an array of strings
Output: an array of strings
Rules:
- The output array contains a subset of the given array that contain strings that are anagrams of the given string
- An anagram is a word that can be made by rearranging all the letters in the given word
- Identical words are not anagrams
- Anagrams are not case-sensitive
Class needs:
- #initialize take a string as an argument
- #match takes an array as an argument and returns an array
--- E
- 'listen', ['enlists', 'google', 'inlets', 'banana'] => ['inlets']
--- D
Input: string and array of strings
In-between: array of characters
Output: array of strings
--- A
- Iterate through the given array
- For each iteration,
  - Skip iteration if given word matches the current word
  - Split the given word and the current word to their characters
  - Sort the characters and compare them
  - Select the word if the array of characters are equal
=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    chars = @word.downcase.chars.sort

    possible_anagrams.select do |anagram|
      next if anagram.downcase == @word.downcase
      anagram.downcase.chars.sort == chars
    end
  end
end
