=begin
--- P
Input:
- A string
- String can contain one or more spaces
Output:
- ASCII string value of the given string which is,
  - The sum total of the ASCII values of all characters
Implicit rules:
- Only alphabetic characters and spaces are given as part of the string
- An empty string is a valid input
--- E
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
--- D
- Split the given string into an array containing its individual characters
--- A
- Return 0 if the string is empty
- Split the given string into an array of its characters
- Iterate through the array
- Set the initial total value as 0
- For each iteration,
  - Return the ASCII value of the character
  - Add the value to the total value
- Return the total value
=end
