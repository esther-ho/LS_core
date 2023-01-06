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
