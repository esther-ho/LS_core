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
- Create the box as an array of strings
- Convert the string into an array of words
--- A
- Find the length of the string if string is not empty
- Set `dash` to '-' multiplied by length of the string
- Set `space` to ' ' multiplied by length of the string
- If the string length is greater than 0,
  - Split the string into an array of individual words
  - Remove the first word from the array and color red
  - Prepend the first word to the array and convert to string
- Create the top of the box using an array of interpolated string
- Create the middle of the box as a interpolated string
- Reverse the values in the box top
- Join the box top, middle and reversed top and print to screen
=end

require 'colorize'

def print_in_box(string)
  box_top = ["+-#{'-' * string.size}-+", "| #{' ' * string.size} |"]

  if string.size > 0
    words = string.split
    first_word = words.shift.red
    string = words.unshift(first_word).join(' ')
  end

  puts box_top + ["| #{string} |"] + box_top.reverse
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
