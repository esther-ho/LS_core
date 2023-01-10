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
- Set `HR = 24` and `MIN = 60` as constants
- Return '00:00' if integer is 0
- Divide the absolute value of the integer by `MIN`
- Assign the quotient and remainder to `h` and `m`
- Divide `h` by `HR` and assign the remainder to `h`
- If the given integer is negative,
  - Subtract `h` from `HR - 1` and reassign it to `h`
  - Subtract `m` from `MIN` and reassign it to `m`
- Convert and format both numbers to return a two digit string
- Print `h` and `m` in 00:00 format
=end

HR = 24
MIN = 60

def time_of_day(integer)
  return '00:00' if integer == 0
  h, m = integer.abs.divmod(MIN)
  h %= HR
  if integer < 0
    h = HR - 1 - h
    m = MIN - m
  end
  h, m = [h, m].map { |s| s.to_s.rjust(2, '0') }
  "#{h}:#{m}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
