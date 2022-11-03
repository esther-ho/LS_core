=begin
--- P
Inputs:
- A whole number larger than 0
- A `true` or `false` boolean
Output:
- An integer that is:
  - Half of the given input if the given boolean is `true`
  - 0 if the given boolean is `false`
Implicit rules:
- None of the inputs are optional
- The return value is not a float

--- E
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

--- D

--- A
- Check if the given boolean is `true` or `false`
- If true,
  - Divide the given number by 2
  - Return the result
- If false,
  - Return 0

=end

def calculate_bonus(salary, bonus)
  bonus ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
