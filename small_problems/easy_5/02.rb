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

MIN_PER_HOUR = 60
HR_PER_DAY = 24

def time_of_day(integer)
  return '00:00' if integer == 0
  h, m = integer.abs.divmod(MIN_PER_HOUR)
  h %= HR_PER_DAY
  if integer < 0
    h = HR_PER_DAY - 1 - h
    m = MIN_PER_HOUR - m
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

=begin
Alternative:
def time_of_day(integer)
  h, m = integer.divmod(MIN_PER_HOUR)
  h %= HR_PER_DAY
  format("%02d:%02d", h, m)
end

- `#divmod` returns the quotient and modulus.
- When dividing a negative number with a positive one,
  - The quotient is negative
  - The modulo is positive
  - e.g. -5.divmod(2) = [-3, 1]
- Using this property, we can divide both negative and positive integers
  - e.g. 3 min before midnight is noted as (-3)
  - `-3.divmod(60)` => [-1, 57]
  - -3 % 60 => -3 - (60 * (-3 / 60).floor)
  - `-1.divmod(24)` => [-1, 23]
  - e.g. 3 min after midnight is noted as (3)
  - `3.divmod(60)` => [0, 3]
  - `0.divmod(24)` => [0, 0]
- For example,
  - For 1440 min / day
  - `-3000 % 1440` => 1320
  -  `min = -3000
      while min < 0
        min += 1440
      end` (min => 1320)
  - Both methods return the same value
=end
