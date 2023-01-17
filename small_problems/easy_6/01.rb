=begin
--- P
Input:
- A floating point number (number with a decimal place)
Output:
- A string of the given number in degress, minutes, and seconds
  - Each degree has 60 minutes
  - Each minute has 60 seconds
Explicit rules:
- Numbers should be represented as two digit numbers with leading zeros
  - Only for minutes and seconds
Implicit rules:
- Degrees < 10 can be represented by a single digit in the degrees' place
- Given integer does not exceed 360
--- E
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
--- D

--- A
- Set the constants for:
  - Minutes per degree
  - Seconds per minute
  - Seconds per degree
- Multiply the given number by `seconds per degree`
- Divide the result by `seconds per minute`
  - Assign the quotient to `minutes`
  - Assign the remainder to `seconds`
- Divide `minutes` by `minutes per degree`
  - Assign the quotient to `degree`
  - Assign the remainder to `minutes`
- Format the output to "%(dd°mm'ss")"
=end
