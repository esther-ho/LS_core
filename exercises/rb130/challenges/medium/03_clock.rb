=begin
--- P
Input: up to 2 integers
  - 1st represents hour
  - 2nd represents minute
Output: a string when invoking #to_s
Rules:
- Clock is independent of date
- Do not use built-in date/time functionality
- Time added or subtracted can be greater than one day
Class needs:
- ::at accepts up to 2 integers (hour, min) and returns a clock object
- #initialize creates Clock object with total minutes
- #to_s return a string based on 24h time e.g. "23:10"
- #+ adds minutes to time represented and returns NEW clock object
- #- subtracts minutes to time represented and returns NEW clock object
- #== returns true if clocks represent same time
--- E
(11, 9) => "11:09"
(0) - 50 => "23:10"
(23, 30) + 60 => "00:30"
--- D
Input: integers
In-between: total minutes
Output: string
--- A
- Calculate total minutes based on input
  - Multiply hours by 60
- Generate string by dividing total minutes by 60
  - Quotient is the hours
  - Remainder is the minutes
- When adding minutes to a clock
  - Add minutes to total minutes
  - Reassign total minutes to the modulo of minutes per day
  - Return a new clock object with the new time
- When subtracting minutes from a clock
  - Subtract minutes to total minutes
  - Reassign total minutes to modulo of minutes per day
  - Return a new clock object with the new time
- Compare clock objects by their #to_s return
=end

class Clock
  MIN_PER_HOUR = 60
  MIN_PER_DAY = MIN_PER_HOUR * 24

  def self.at(hour, min = 0)
    new(hour * MIN_PER_HOUR + min)
  end

  def initialize(total_min)
    @total_min = total_min
  end
  
  def +(min)
    new_total_min = (@total_min + min) % MIN_PER_DAY
    self.class.new(new_total_min)
  end
  
  def -(min)
    self + (-min)
  end
  
  def ==(other)
    total_min == other.total_min
  end
  
  def to_s
    hour, min = @total_min.divmod(MIN_PER_HOUR)
    format("%02d:%02d", hour, min)
  end

  protected
  
  attr_reader :total_min
end
