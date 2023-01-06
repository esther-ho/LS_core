=begin
--- P
Input:
- A year either according to:
  - Julian Calendar (years before 1752)
  - Gregorian Calendar (year 1752 and after)
Output:
- Return `true` if year is within Julian Calendar and divisible by 4
- Return `true` if year is within Gregorian Calendar and:
  - Divisible by 400
  - Divisible by 4, but not 100
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
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
--- D

--- A
- Return `true` if year is before 1752 and divisible by 4
- Else, if year is 1752 and later,
  - If divisible by 400,
    - Return `true`
  - If divisible by 4 but not 100,
    - Return `true`
  - Otherwise, return `false`
=end

def leap_year?(year)
  return true if year < 1752 && year % 4 == 0
  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

=begin
Further exploration:
- Singapore was colonized by the British from 1819 - 1942.
  - The Gregorian calendar was likely adopted during colonization.
- Certain communities in Singapore also use the Lunisolar calendar
  - A leap year is approximately every 3 years
  - It's considered a leap year when they are 13 New Moons between:
    - Start of 11th month in first year, and
    - Start of 11th month in next year
=end
