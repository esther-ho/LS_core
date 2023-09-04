=begin
Input: an integer
Output: an integer, which is the next featured number greater than the given integer OR an error message

Rules:
- A featured number is:
  - odd
  - multiple of 7
  - each digit occurs exactly once each

--- E
21 is given -> 35 (next featured number has to be greater)
9_999_999_999 -> no featured number because there are 10 digits

--- D
input: an integer
in-between: an array of digits of a possible featured number
output: an integer greater than the given integer

--- A
- Check if integer greater than given integer has more than 10 digits
  - Return an error message if integer more than 10 digits
- Find the next greatest multiple of 7 from the given number
- Starting from the nearest multiple of 7, iterate through every multiple of 7
  - If the number is odd and all digits are unique, return the number
  - Else, continue to iterate
=end

def featured(number)
  if number.succ.digits.size > 10
    puts 'Invalid number'
    return
  end

  nearest_multiple = (number / 7).succ * 7

  nearest_multiple.step(by: 7) do |num|
    return num if num.odd? && num.digits.uniq.size == num.to_s.size
  end
end

# Alternative

# def featured(number)
#   quotient = number / 7
#   nearest_multiple = (quotient.odd? ? quotient + 2 : quotient + 1) * 7

#   nearest_multiple.step(by: 14) do |num|
#     return num if num.digits.uniq == num.digits
#     break if num.digits.size > 10
#   end

#   "There is no possible number that fulfills those requirements."
# end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
