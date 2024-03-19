=begin
--- P
Input: string of integers
Output: an array of subarrays where,
- each subarray has the number of digits specified
Rules:
- Subarrays are consecutive
  - e.g. digit appearing in first subarray may appear in next subarray
- Raise error if specified length is longer than length of given string
Class needs:
- #initialize takes a string
- #slices takes a length and returns an array of subarrays
  - raises ArgumentError if given length > string length
--- E
'01234'.slices(3) => [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
--- D
Input: string
Output: array of subarrays
--- A
- Raise ArgumentError if given length > string length
- Split string into its characters
- Initialize empty `results` array
- Iterate over the characters array
- For each iteration,
  - Return a subset of characters of given length
  - Convert the characters to integers
  - Push subarray to `results` array
- Return `results` array
=end

class Series
  def initialize(digit_string)
    @digit_string = digit_string
  end

  def slices(slice_length)
    raise ArgumentError, "Invalid length" if slice_length > @digit_string.size

    result = []
    @digit_string.chars.each_cons(slice_length) do |char_arr|
      result << char_arr.map(&:to_i)
    end

    result
  end

  # alternative

  # def slices(slice_length)
  #   raise ArgumentError, "Invalid length" if slice_length > @digit_string.size

  #   result = []

  #   0.upto(@digit_string.size - slice_length) do |i|
  #     result << @digit_string.chars[i..-1].take(slice_length).map(&:to_i)
  #   end

  #   result
  # end
end
