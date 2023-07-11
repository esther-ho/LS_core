=begin
----- P
Inputs:
- A whole number larger than zero
- An optional argument that defaults to '1'
Output:
- A string with length matching the given number and,
  - If the optional argument is set to '1',
    - With 1s and 0s alternating, starting with '1'
  - Otherwise,if the optional argument is set to '0',
    - With 0s and 1s alternating, starting with '0'

Implicit rules:
- The input can be modified

----- E
# puts stringy(6) == '101010'
# puts stringy(9, 0) == '010101010'
# puts stringy(4, 0) == '0101'
# puts stringy(7, 1) == '1010101'

----- D
- Use an array to store the appropriate integer for each iteration

----- A
- Create a new array called 'numbers'
- Iterate as many times as defined by the given integer
- For each iteration,
  - If '0' is passed as the optional argument,
    - If the current iteration is even,
      - Assign 0 to the variable 'number'
    - Otherwise, if the current iteration is odd,
      - Assign 1 to the variable 'number'
    - Append the integer assigned to 'number' to the 'numbers' array
  - Otherwise, if '1' is passed as the optional argument,
    - If the current iteration is even,
      - Assign 1 to the variable 'number'
    - Otherwise, if the current iteration is even,
      - Assign 0 to the variable 'number'
    - Append the integer assigned to 'number' to the 'numbers' array
  - Join the integers in the array to form a new string
  - Return the new string

=end

def stringy(size, start_with = 1)
  numbers = []

  size.times do |index|
    if start_with == 0
      number = index.even? ? 0 : 1
      numbers << number
    else
      number = index.even? ? 1 : 0
      numbers << number
    end
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 1) == '1010101'
