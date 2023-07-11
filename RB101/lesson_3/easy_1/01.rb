=begin
The code will print '1', '2', '2', '3' on separate lines.
`#Array.uniq` creates a new array with unique values.
It does not mutate the original array.
=end

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# `puts` writes each element of an array on a new line
# `puts` also converts non-string objs by calling `to_s`
