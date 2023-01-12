=begin
--- P
Input:
- An array of whole numbers from 0 to 19
Output:
- Number array sorted by the value of their corresponding alphabetic string
Implicit rules:
- Strings are all lowercase
- Array that is returned is a new array
--- E
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
--- D
- Use a hash where:
  - Keys are the integers from 0 to 19
  - Values are the corresponding english word for the number
- An array containing the integers 0 to 19
--- A
- Initialize a hash where:
  - Keys are the integers from 0 to 19
  - Values are the corresponding english word for the number
- Sort the number array by comparing:
  - Word value of current number to that of the next number
=end

NUM_WORD = {
  0 => 'zero', 1 => 'one', 2 => 'two',
  3 => 'three', 4 => 'four', 5 => 'five',
  6 => 'six', 7 => 'seven', 8 => 'eight',
  9 => 'nine', 10 => 'ten', 11 => 'eleven',
  12 => 'twelve', 13 => 'thirteen',
  14 => 'fourteen', 15 => 'fifteen',
  16 => 'sixteen', 17 => 'seventeen',
  18 => 'eighteen', 19 => 'nineteen'
}

def alphabetic_number_sort(nums)
  nums.sort { |n1, n2| NUM_WORD[n1] <=> NUM_WORD[n2] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=begin
Alternative:
NUM_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(nums)
  nums.sort_by { |num| NUM_WORDS[num] }
end
=end
