=begin
It will return a TypeError.
You cannot concatenate a string with an integer.
You can fix it by either:
- Calling `#to_s` on `(40 + 2)`
- Use string interpolation
=end

# Incorrect: puts "the value of 40 + 2 is " + (40 + 2)
# Correct
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"
