=begin
--- P
Input: a letter
Output: multiple strings that makes a diamond
Rules:
- The diamond starts and ends with one 'A'
- The supplied letter is the widest point
- All rows, except first and last, have two identical letters
- Diamond is horizontally and vertically symmetric
- Diamond has a square shape (equal heigh and width)
- Top half has letters in ascending and bottom half has letters in descending
Class needs:
- ::make_diamond accepts a letter
--- E
A => A

C =>
  A
 B B
C   C
 B B
  A

E =>
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A
--- D
Input: a string - letter
In-between: array of strings
Output: multiple strings
--- A
- Print line with correct spacing based on the letter
  - If 'A', print only 'A' with no spaces
  - Else, print two letter separated by odd length of spaces based on the sequence from 'A'
    e.g 'B' -> 1 space, 'C' -> 3 spaces, 'D' -> 5 spaces etc
- Add spaces to lines based on the length of widest length
  - Find difference between lengths of current line and widest line
  - Split additional spaces and add to the front and back of current line
- Add new line at the end of each line
- Return lines in appropriate order
=end

class Diamond
  def self.make_diamond(letter)
    lines = multi_line(letter) + multi_line(letter).reverse[1..-1]
    lines.join
  end

  def self.multi_line(letter)
    widest = single_line(letter).length
    
    ('A'..letter).map do |letter|
      current_line = single_line(letter)
      diff = widest - current_line.size
      spaces = ' ' * (diff / 2)
      spaces + current_line + spaces + "\n"
    end
  end
  
  def self.single_line(letter)
    case letter
    when 'A'
      'A'
    when 'B'
      'B B'
    else
      space_length = 1 + 2 * (letter.ord - 'B'.ord)
      letter + ' ' * space_length + letter
    end
  end
end
