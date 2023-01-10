=begin
--- P
Input:
- A integer
- Can be negative, 0, or positive
Output:
- A string form of the integer, which is preceded by:
  - A `+` sign if the integer is positive
  - A `-` sign if the integer is negative
  - No sign if the integer is 0
--- E
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
--- D
- Store strings in an ordered array from smallest to largest
- Split absolute value of integer into an array containing its digits
--- A
- Return '0' if integer is `0`
- Convert the integer to its absolute value
- Split the integer into an array of digits
- Iterate through the array
- Set `string` as an empty string
- For each iteration,
  - Find the string value of the digit at the current iteration
  - Prepend the string value to `string`
- If the integer is negative
  - Prepend a `-` sign to the string
- Else, if the integer is not negative
  - Prepend a `+` sign to the string
=end

DIGITS = ('0'..'9').to_a

def signed_integer_to_string(integer)
  return '0' if integer == 0
  string = integer.abs.digits.inject('') do |str, val|
    str.prepend(DIGITS[val])
  end
  integer.negative? ? "-#{string}" : "+#{string}"
end

def signed_integer_to_string(integer)


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

=begin
Further exploration:
def signed_integer_to_string(number)
  integer = integer_to_string(number.abs)
  return integer if number = 0
  integer < 0 ? "-#{integer}" : "+#{integer}"
end
=end
