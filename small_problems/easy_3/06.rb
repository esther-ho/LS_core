=begin
--- P
Inputs:
- Two arguments
Outputs:
- Return `true` if only one argument is truthy, else return `false`

Implicit rules
- Arguments given evaluate to boolean arguments (true, false)
--- E
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
--- D

--- A
- Convert both arguments to a boolean value
- If both boolean values are the same,
  - Return true
- Else, return false
=end
