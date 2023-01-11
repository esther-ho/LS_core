=begin
--- P
Input:
- String representing time in 24h format
Output:
- `before_midnight` returns minutes before midnight based on input
- `after_midnight` returns minutes after midnight based on input
Explicit rules:
- Disregard daylight savings and standard time
- `Date` and `Time` class methods cannot be used
Implicit rules:
- Given time is not day-dependent
--- E
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
--- D

--- A
- Set constants for MIN_PER_HOUR and MIN_PER_DAY
- For `after_midnight`,
  - Return 0 if string is '00:00' or '24:00'
  - Split the string using `:` as the delimiter and convert to integers
  - Assign first element to `hr` and second element to `min`
  - Multiply `hr` by MIN_PER_HOUR
  - Sum `hr` and `min`
- For `before_midnight`
  - Return 0 if string is '00:00' or '24:00'
  - Subtract the result of `after_midnight` from MIN_PER_DAY
=end

require 'time'

MIN_PER_HOUR = 60
HOUR_PER_DAY = 24
MIN_PER_DAY = MIN_PER_HOUR * HOUR_PER_DAY

def after_midnight(time)
  hr, min = time.split(':').map(&:to_i)
  ((hr * MIN_PER_HOUR) + min) % MIN_PER_DAY
end

def before_midnight(time)
  (MIN_PER_DAY - after_midnight(time)) % MIN_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

=begin
Further exploration:
def after_midnight(time)
  ((Time.parse(time) - Time.parse('00:00')) / SEC_PER_MIN) % MIN_PER_DAY
end
=end
