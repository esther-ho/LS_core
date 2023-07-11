=begin
--- P
Inputs:

Outputs:
- Print all odd numbers from 1 to 99, including 1 and 99
- Each number is on a separate line
Implcit rules:
- Numbers are all whole numbers
- Start printing from 1 to 99, in order
--- E

--- D

--- A
- Initialize a range of numbers from 1 to 99
- Filter the array to only contain odd numbers
- Print the numbers in the array on a separate line each
=end

puts (1..99).select(&:odd?)

# alternative: 1.upto(99) { |num| puts num if num.odd? }
