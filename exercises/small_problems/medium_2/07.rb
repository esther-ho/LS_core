=begin
--- P
Input: a number representing a year
Output: a number, representing the count of Friday the 13ths in that given year

Rules:
- The year given is greater than 1752, after the Gregorian calendar is adopted

--- E
2015 -> 3 Friday the 13ths
1986 -> 1 Friday the 13th
2019 -> 2 Friday the 13ths

--- D
Input: a number
Output: a number

--- A
- Initialize a counter to 0
- Iterate through each month of the given year
  - If a Friday the 13th is found for that month, increment the counter by 1
- Return the counter
=end

require 'date'

def friday_13th(year)
  counter = 0

  (1).upto(12) do |month|
    counter += 1 if Date.new(year, month, 13).friday?
  end

  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further exploration

def five_friday_months(year)
  counter = 0

  1.upto(12) do |month|
    fridays = Date.new(year, month, 1).upto(Date.new(year, month, -1)).select { |date| date.friday? }
    counter += 1 if fridays.size == 5
  end

  counter
end

p five_friday_months(2021) == 5
p five_friday_months(2023) == 4
