=begin
--- P
- Input:
  - Ask user for length and width in meters
- Output:
  - Print area of the room based on given length and width
  - Area should be given in square meters and square feet
- Implicit rules:
  - Inputs given are valid numbers
  - Inputs are both positive numbers
  - The input can be modified
  - Output is rounded to nearest second decimal place
--- E
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
--- D

--- A
- Ask the user for the length of the room in meters
- Store the length given
- Ask the user for the width of the room in meters
- Store the width given
- Convert the length and width to floats
- Multiply the length and width to obtain the area in square meters
- Multiply the square meters by 10.7639 to obtain the area in square feet
- Round the areas to 2 decimal place
- Print the areas

=end

def calculate_area
  puts "Enter the length of the room in meters:"
  length = gets.chomp.strip
  puts "Enter the width of the room in meters:"
  width = gets.chomp.strip

  square_meters = length.to_f * width.to_f
  square_feet = square_meters * 10.7639

  puts "The area of the room is #{square_meters.round(2)} square meters"\
      " (#{square_feet.round(2)} square feet)."
end

calculate_area
