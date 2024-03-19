=begin
--- P
- input: two strings
- output: integer
- rules:
  - Input strings may have equal or unequal length
  - If strings are unequal, use length of shorter string
  - Output integer is the Hamming distance
      -the number of point mutations (character differences) between the strings
--- E
- '', '' => 0
- '', 'a' => 0
- 'aaat', 'aaaa' => 1
- 'aaat', 'aaa' => 0
--- D
- input: strings
- in-between: array of characters
- output: integer
--- A
- Find shorter string
- Split shorter string into its characters
- Initialize a counter to 0
- For each iteration,
  - Compare each character in the shorter string to the other string
  - If the character does not match, increment counter by 1
- Return counter
=end

class DNA
  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    short, long = [@sequence, other_sequence].sort_by(&:size)
    short.chars.each_with_index.reduce(0) do |sum, (char, i)|
      char == long[i] ? sum : sum +  1
    end

    # alternative
    # (0...short.size).count { |i| short[i] != long[i] }
  end
end
