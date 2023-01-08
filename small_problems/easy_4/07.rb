=begin
--- P
Input:
- A string containing only numeric characters
Output:
- An integer form of the numeric string
Implicit rules:
- The input can be modified
--- E
string_to_integer('4321') == 4321
string_to_integer('570') == 570
--- D
- Hash containing:
  - Keys as individual numeric strings e.g. ('1')
  - Values as individual numeric digits e.g. (1)
- Array of numeric characters
- Array of integer digits
--- A
- Initialize a hash of key-value pairs of numeric strings and numbers
- Split the string into its individual characters
- Iterate through each value in the resultant array
- Set the initial total as 0
- For each iteration,
  - Multiply the current total by 10
  - Return the appropriate numeric value from the hash based on the key
  - Add the numeric value
=end

DIGITS = (('0'..'9').zip(0..9)).to_h
def string_to_integer(num_string)
  num_string.chars.inject(0) do |result, str|
    result * 10 + DIGITS[str]
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
