=begin
--- P
Input: two integers,
- one representing month (1-12)
- other representing year (e.g. 2021)
AND two strings,
- one representing day of the week (e.g. 'Monday')
- other representing "nth day" day of the month (e.g. first 'Monday')
Output:
- Date object
- nil if date doesn't exist
Rules:
- Case of strings does not matter
- "teeth" days are days between "13 - 19"
Class needs:
- Meetup#initialize takes 2 arguments: year (e.g. 2021) and month (1 - 12)
- #day takes two arguments: day (e.g. 'Monday') and nth (e.g. 'first')
--- E
Meetup.new(2013, 4).day('monday', 'FIRST') => Date.civil(2013, 4, 1)
Meetup.new(2016, 2).day('Sunday', 'fifth') => nil
Meetup.new(2017, 1).day('Thursday', 'teeth') => Date.civil(2017, 1, 19)
--- D
Input: integers and strings
In-between: hash of date objects
Output: date object or nil
--- A
- Build hash of date objects where
    - Key is the day
    - Value is an array of date objects in increasing order
  - Find start and end dates of each month
  - Iterate through the month
  - Add each day to the array assigned to the appropriate 'day' key
- Look up appropriate date object
  - If given "teeth",
    - Find appropriate array based on day
    - Find date object where day is between 13-19
  - Else,
    - Find appropriate array based on day
    - Find nth date object in the array
    - Return nil if date object is not found
=end

require 'date'

class Meetup
  ORDINALS = %w(first second third fourth fifth)

  def initialize(year, month)
    @start_date = Date.civil(year, month)
    @end_date = Date.civil(year, month, -1)
  end

  def day(day_of_week, ordinal)
    day_of_week = "#{day_of_week.downcase}?".to_sym
    possible_dates = (@start_date..@end_date).select(&day_of_week)

    case ordinal.downcase
    when 'teenth' then possible_dates.find { |date| date.day.between?(13, 19) }
    when 'last'   then possible_dates[-1]
    else               possible_dates[ORDINALS.index(ordinal.downcase)]
    end
  end
end
