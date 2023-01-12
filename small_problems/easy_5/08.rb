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
- Iterate through the number array
- For each iteration,
  - Compare the english word of the current number to the next number
  - If the word value of the current number is larger,
    - Swap the current number with the next number
- Return the numbers array
=end
