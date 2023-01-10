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

DIGITS = ('0'..'9').to_a

def integer_to_string(integer)
  integer.digits.inject('') do |string, value|
    string.prepend(DIGITS[value])
  end
end

=begin
Alternatives:
def integer_to_string(integer)
  integer.digits.each_with_object('') do |value, string|
    string.prepend(DIGITS[value])
  end
end

def integer_to_string(integer)
  integer.digits.reverse.join
end
=end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

=begin
Mutating `String` methods without `!`
- #<<
- #[]=
- #clear
- #concat
- #replace
- #insert
- #prepend

Mutating `Array` methods without `!`
- #<<
- #[]=
- #append
- #concat
- #delete
- #delete_at
- #delete_if
- #fill
- #insert
- #keep_if
- #pop
- #push
- #replace
- #shift
- #unshift
- #prepend

Mutating `Hash` methods without `!`
- #clear
- #delete
- #delete_if
- #replace
- #keep_if
- #rehash (if keys were changed)
- #shift
- #[]=
- #update

`Array#sort_by!` doesn't have a corresponding `#sort_by` method without `!`.
However, it works similarly to `Enumerable#sort_by`.
It appears that methods only have a mutating form are not marked with a `!`.
Methods with non-mutating and mutating forms often use `!` for differentiation.
=end
