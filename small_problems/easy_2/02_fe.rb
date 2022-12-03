=begin
--- P
Inputs:
- Length of room in feet
- Width of room in feet
Output:
- Area of the room in:
  - Square feet
  - Square inches
  - Square centimeters
--- E

--- D
Hash to store values to convert square feet to:
  - Square inches
  - Square centimeters
--- A
- Initialize hash to store values to convert square feet
- Ask user for length in feet and store the value
- Ask user for width in feet and store the value
- Convert the string input to floats
- Multiply the values to get the area in square feet
- Convert square feet to square inches and square cm
- Print the results
=end

CONVERT_SQFEET = {
  sqinch: 144,
  sqcm: 929.03
}

puts "Enter the length of the room in feet:"
length = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width = gets.chomp.to_f

sqfeet = length * width.round(2)
sqinch = sqfeet * CONVERT_SQFEET[:sqinch].round(2)
sqcm = sqfeet * CONVERT_SQFEET[:sqcm].round(2)

puts "The area of the room is #{sqfeet} square feet.\n" \
     "(#{sqinch} square inches / #{sqcm} square centimeters)"
