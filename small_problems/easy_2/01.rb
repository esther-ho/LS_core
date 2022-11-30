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
- Create an array of numbers ranging from 20 to 200
- Sample a number randomly from the array
- Return the sampled number and print it
=end

age = (20..200).to_a.sample
puts "Teddy is #{age} years old!"
