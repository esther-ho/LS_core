=begin
--- P
Input:
- A year in whole numbers
Output:
- Return `true` if year is a leap year
- Return `false` if year is not a leap year
Explicit rules:
- Leap years are divisible by either 4 or 400
- Leap years are not divisible by 100
Implicit rules:
- Only years greater than 0 are given
- Only numeric strings are given
--- E
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
--- D

--- A
- If divisible by 400,
  - Return `true`
- If divisible by 4 BUT NOT 100,
  - Return `true`
- Else, return `false`
=end

def leap_year?(year)
  return true if year % 400 == 0
  (year % 4 == 0) != (year % 100 == 0)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
