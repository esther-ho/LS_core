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
  DAYS_OF_WEEK = %w(sunday monday tuesday wednesday thursday friday saturday)
  ORDINALS = { 'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5 }

  attr_reader :days_in_month

  def initialize(year, month)
    @year = year
    @month = month
    build_days_in_month
  end

  def day(day_of_week, ordinal)
    dates = @days_in_month[day_of_week.downcase]

    case ordinal.downcase
    when 'teenth' then teenth_date(dates)
    when 'last'   then dates[-1]
    else               dates[ORDINALS[ordinal.downcase] - 1]
    end
  end

  private

  def build_days_in_month
    @days_in_month = {}
    1.upto(total_days) do |day|
      date = Date.new(@year, @month, day)
      cday = DAYS_OF_WEEK[date.wday]
      if @days_in_month[cday]
        @days_in_month[cday] << date
      else
        @days_in_month[cday] = [date]
      end
    end
  end

  def total_days
    Date.new(@year, @month, -1).day
  end

  def teenth_date(dates)
    dates.find { |date| date.day.between?(13, 19) }
  end
end
