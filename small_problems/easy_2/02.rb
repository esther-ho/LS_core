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
- calculate_area(10, 7) # => 70 square meters (753.47 square feet)
- calculate_area(4.5, 5) # => 22.5 square meters (242.19 square feet)
--- D

--- A
- Ask the user for the length of the room in meters
- Store the length given
- Ask the user for the width of the room in meters
- Store the width given
- Multiply the length and width to obtain the area in square meters
- Multiply the square meters by 10.7639 to obtain the area in square feet
- Round the areas to 2 decimal place
- Print the areas

=end
