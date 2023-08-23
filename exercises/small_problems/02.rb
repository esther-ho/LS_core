=begin
--- P
Input: an integer
Output: an integer, which may be:
- The given integer
- The given integer multiplied by 2

Explicit rules:
- Return the given integer if it is a double number
- Return the integer multiplied by 2 if it is not a double number

Implicit rules:
- Not all integers will have an even number of digits

--- E
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

--- D
Input: an integer
In-between:
- The string representation of the integer
- An array with 2 string elements:
  - Digits of first half of the integer
  - Digits of second half of the integer
Output: an integer

--- A
- Check if the number has an even number of digits
  - Return the number multiplied by 2 if the number of digits is odd
- Check if the number is doubled
  - Find the middle of the integer
  - If the integers to the left and right of the middle position match,
    - Return the integer
  - Else, return the integer multiplied by 2
=end

def twice(number)
  num_string = number.to_s
  return number * 2 if num_string.size.odd?

  middle = num_string.size / 2
  left, right = num_string.scan(/\d{#{middle}}/)
  left == right ? number : number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

