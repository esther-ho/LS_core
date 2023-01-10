=begin
--- P
Input:
- Minutes in integers
  - Can be positive or negative
Output
- Time of day in 24 hour format (hh:mm)
- If input is negative, time is before midnight
- If input is positive, time is after midnight
Explicit rules:
- Daylight savings and standard time are ignored
Implicit rules:
- An integer value is always given
- Time returned is not relative to the current day
- Time of day is returned as a string
--- E
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
--- D

--- A
- Divide the integer by 60 and assign the quotient and remainder to `h` and `m`
- Divide `h` by 24 and assign the remainder to `h`
- If the given integer is negative,
  - Subtract `h` from 24 and reassign it to `h`
  - Subtract `m` from 60 and reassign it to `m`
- Convert and format both numbers to return a two digit string
- Print `h` and `m` in 00:00 format
=end
