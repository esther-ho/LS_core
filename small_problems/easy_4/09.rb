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
- Set an empty string `string` as the initial value
- For each iteration,
  - Return the string value of the corresponding integer from the hash
  - Prepend the string value to `string`
=end

DIGITS = ((0..9).zip('0'..'9')).to_h

def integer_to_string(integer)
  integer.digits.inject('') do |string, value|
    string.prepend(DIGITS[value])
  end
end

=begin
Alternative:
def integer_to_string(integer)
  integer.digits.each_with_object('') do |value, string|
    string.prepend(DIGITS[value])
  end
end
=end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
