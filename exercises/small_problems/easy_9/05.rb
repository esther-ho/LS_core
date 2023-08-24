=begin
--- P
Input: a string which contains:
- a first name
- a space
- a last name
Output: a single which contains:
- a last name
- a comma and a space
- a first name

Explicit rules:
- The first name and last name are separated by a space in the input string
- The last name and first name are separated by a comma and space in the output string

Implicit rules:
- The input string will have two words separated by a space
- The case of each character is retained in the output string

--- E
swap_name('Joe Roberts') == 'Roberts, Joe'

--- D
Input: a string
In-between: an array with 2 strings: first and last name
Output: a string

'Joe Roberts' -> ['Joe', 'Roberts'] -> 'Roberts, Joe'

--- A
- Split the first and last name into individual words
- Print the last name, followed by a comma and space, followed by the first name
=end

def swap_name(name)
  first, last = name.split
  last + ', ' + first
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
