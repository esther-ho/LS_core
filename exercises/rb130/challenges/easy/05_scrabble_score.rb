=begin
--- P
Input: string
Output: integer
Rules:
- Different letters have different values
- Each letter has a point
- Non-string inputs return 0
- Strings with non-letter characters return 0
- Case does not matter
Class needs:
- #initialize accepts a string or nil
- #score outputs the total score
- ::score accepts a string as an input and outputs total score
--- E
- CABBAGE => 14
- \t\n => 0
- nil => 0
- 'a' => 1
--- D
Input: string or nil
Output: integer
--- A
- If given input is not a string or has non-letter characters, return 0
- Split string into its characters
- Iterate through each character
  - Fetch the score of the character based on its uppercase counterpart
- Sum all values
=end

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 unless valid_word?
    @word.upcase.chars.map { |letter| letter_score(letter) }.sum
  end

  def self.score(input)
    word = Scrabble.new(input)
    word.score
  end

  private

  def valid_word?
    @word =~ /^[a-z]+$/i
  end

  def letter_score(letter)
    case letter
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
    when 'D', 'G'                                         then 2
    when 'B', 'C', 'M', 'P'                               then 3
    when 'F', 'H', 'V', 'W', 'Y'                          then 4
    when 'K'                                              then 5
    when 'J', 'X'                                         then 8
    else                                                       10
    end
  end
end
