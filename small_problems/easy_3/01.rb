=begin
--- P
Inputs:
- User input of 6 numbers
Outputs:
- All the numbers given by user
- Whether the last number given appears amongst the previous 5

Implicit rules:
- Numbers given can be repeated
- Numbers do not have to be in any order
- Numbers given are whole numbers
- Numbers given are 0 or greater
- Output array is sorted in order of input

--- E
- The number 17 appears in [25, 15, 20, 17, 23].
- The number 18 does not appear in [25, 15, 20, 17, 23].

--- D
- Use an array to store the first 5 numbers

--- A
- For the first 5 numbers:
  - Ask user for a number
  - Check if input is a valid non-negative integer
  - Convert the input into a number
  - Push the number into an array
- Ask the user for the last number
- Check if input is a valid non-negative integer
- Convert the input into a number
- If the last number exists in the number array
  - Print that it appears in the array
- Else, print that it does not appear in the array

=end
