=begin
A collection of spelling blocks has two letters per block, as shown in this list, 

B, O   X, K   D, Q   C, P   N, A
G, T   R, E   F, S   J, W   H, U
V, I   L, Y   Z, M
This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples, 

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
=end

=begin
--- P
Input,  an string of letters
Output,  a boolean,
- true if the argument can be spelled from the given array
- false if the argument cannot be spelled

Explicit rules, 
- A word shouldn't contain both letters within a block
- Each letter in a block can only be used once
- Each block only contains two letters

Implicit rules, 
- The lettercase of the letters in the argument is not case-sensitive

--- E
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

'BUTCH' == false ,  'U' && 'H' present in the word

--- D
Input,  an argument - a string
Output,  a boolean

--- A
- Check if the argument contains the pairs of letters, with each letter in a pair appearing only once
  - Initialize a collection of subarrays containing the pair of letters
  - Return false,
    - if a letter appears more than once
      - Check if the length of the word is equal to all its unique characters
    - if the pair of letters appears in the word
      - Substitute the letters in the pair with spaces in the given string
      - Check if the modified string is the shorter by the given string by 2 characters
        - 'BUTCH',  'BTC'
- Return true otherwise
=end

def block_word?(word)
  blocks = [
    ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']
  ]

  return false if word.chars.uniq.size < word.size

  blocks.each do |letter1, letter2|
    new_word = word.sub(/#{letter1}/i, '')
    new_word = new_word.sub(/#{letter2}/i, '')

    return false if word.size - new_word.size == 2
  end

  true
end

# Alternative

# def block_word?(word)
#   blocks = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

#   blocks.each do |block|
#     return false if word.count(block + block.downcase) > 1
#   end

#   true
# end

p block_word?('bob') == false
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
