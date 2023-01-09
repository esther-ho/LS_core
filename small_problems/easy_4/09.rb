=begin
--- P
Input:
- A integer
Output:
- The integer but in strings
- e.g. 1 => '1'
Implicit rules:
- Only integers 0 and greater are given
--- E
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
--- D
- Store integers as keys and corresponding strings as values in hash
- Split given integer into an array containing its digits
--- A
- Initialize a hash containing integers and strings as keys and values
- Split given integer into an array containing its digits
- Iterate through the array
- Set an empty string `num_string` as the initial value
- For each iteration,
  - Return the string value of the corresponding integer from the hash
  - Append the string value to `num_string`
=end
