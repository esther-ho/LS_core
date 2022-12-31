=begin
--- P
Input:
- A string
Output:
- The string input enclosed within a box
Implicit rules:
- All case and punctuation remains the same as the original string.
- The first word is colored red.
- The input will fit the terminal window.
- The box size is determined by the string length.
- The box will still be printed when the method is given an empty string.
--- E
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
--- D

--- A
- Save the string into a variable
- Find the length of the string
- Create a box using a multiline string
- Assign the box to a variable
- Initialize a variable `space` to indicate the space needed in the box
- Set `space` as 0
- If the string is not empty,
  - Add the additional '-' or ' ' in the box
  - Add the string to the box
- Print the empty box
=end
