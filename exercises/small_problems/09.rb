=begin
--- P
Input: an array of words - letters with no spaces
Output: print groups of words where,
- each group contains words that are anagrams
  - anagrams: words with the same letters but in a different order

Explicit rules:
- each group should contain words which are anagrams

Implicit rules:
- the words in the group are not sorted based on their order of appearance in the array
- words that have no anagrams do not need to be printed

--- E
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

--- D
Input: an array of words
In-between: a nested array where each subarray contains anagrams with the same characters
Output: arrays of words that are anagrams

--- A
- Find all the words that have anagrams in the input array
  - Split all words into their individual characters
  - Sort all the characters
  - Combine the characters to form a word
  - Remove all the duplicate words
  - Remove any unique words that do not have anagrams
- Group all words with the same characters together
  - Iterate through the words input array
    - If the word is an anagram of the current word,
      - Add it to the subarray
- Print the groups
=end

def print_anagrams(words)
  anagrams = words.map do |word1|
    words.select { |word2| (word1.chars - word2.chars).empty? }
  end
  
  anagrams.uniq.each { |anagram| p anagram }
end

# Alternative:

# def print_anagrams(words)
#   anagrams = {}

#   words.each do |word|
#     anagram = word.chars.sort.join
#     if anagrams.key?(anagram)
#       anagrams[anagram] << word
#     else
#       anagrams[anagram] = [word]
#     end
#   end

#   anagrams.each { |_, v| p v }
# end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

print_anagrams(words)          
