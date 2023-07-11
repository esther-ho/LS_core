=begin
--- P
- Input: -
- Output: A random number between 20 and 200
- Implicit rules:
  - '20' and '200' are included
  - Number printed should be a whole number
--- E
- Output: 'Teddy is 69 years old!'
--- D
- Array of numbers from 20 to 200
--- A
- Sample a number randomly from a range of numbers between 20 and 200
- Return the sampled number and print it
=end

age = rand(20..200)
puts "Teddy is #{age} years old!"
