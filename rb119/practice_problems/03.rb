# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

=begin
--- P
Input: a string containing only letters and spaces
Output: a modified string, where every 2nd character in every 3rd word is uppercase

Rules:
- Words in positions that are multiples of 3, and letters in the those words that are in positions that are multiples of 2, are modified to uppercase
- Other than the above condition, all other characters remain unmodified

--- E
'Lorem Ipsum is simply dummy text of the printing'
is -> iS
text -> tExT
printing -> pRiNtInG

'aaA bB c'
c -> c

--- D
Input: a string
In-between:
- an array of words
- an array of characters in the word
Output: a string

--- A
- Find each 3rd word of the sentence
  - Split the sentence into its individual words
  - Find each 3rd word (index 2, 5, 8...)
- Modify each 2nd letter to its uppercase
  - Split the word into its individual letters
  - Find each 2nd letter (index 1, 3, 5...)
  - Modify the letter to uppercase
- Return the modified sentence
=end

def to_weird_case(sentence)
  sentence.split.map.with_index do |word, i|
    if (i + 1) % 3 != 0
      word
    else
      word.chars.map.with_index do |char, i|
        i.odd? ? char.upcase : char
      end.join
    end
  end.join(' ')
end

# Alternative

def to_weird_case(sentence)
  sentence.gsub(/(\w+ ){2}\K\w+/) do |word|
    word.gsub(/.\K./) { |letter| letter.upcase }
  end
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".
