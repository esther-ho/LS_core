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

# Truncate message if larger that (80 - 4) columns
def print_truncated_box(string)
  if string.size > (80 - 4)
    string.slice!((80 - 8)..(string.size - 1))
    string << '...'
  end

  length = string.size
  horizontal_rule = "+#{'-' * (length + 2)}+"
  empty_line = "|#{' ' * (length + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_rule
end

print_truncated_box("It is a period of civil war. \
Rebel spaceships, striking from a hidden base, \
have won their first victory against the evil Galactic Empire. \
During the battle, Rebel spies managed to steal secret plans to the \
Empire's ultimate weapon, the DEATH STAR, and space station \
with enough power to destroy an entire planet.")
print_truncated_box("It is a period of civil war.")
print_truncated_box("")

def print_wrap_box(string)
  line_width = 80 - 4
  lines = [""]
  unless string.empty?
    lines = string.scan(/.{1,#{line_width}}\b\W?/).map(&:strip)
  end

  length = lines.map(&:size).max
  box_top = ["+-#{'-' * length}-+", "| #{' ' * length} |"]

  puts box_top
  lines.each do |line|
    puts "| #{line}#{' ' * (length - line.size)} |"
  end
  puts box_top.reverse
end

print_wrap_box("It is a period of civil war. \
Rebel spaceships, striking from a hidden base, \
have won their first victory against the evil Galactic Empire. \
During the battle, Rebel spies managed to steal secret plans to the \
Empire's ultimate weapon, the DEATH STAR, and space station \
with enough power to destroy an entire planet.")
print_wrap_box("It is a period of civil war.")
print_wrap_box("")
