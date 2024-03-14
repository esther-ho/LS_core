=begin
--- P
Input: a positive integer and a set containing a single or multiple integers
Output: an integer, which is the sum of multiples of the integers in the set that are less than the first number
Rules:
- If a set is not given, use a default set of 3 and 5
- Multiples that are repeated are only counted once
Class needs:
- #initialize takes a set of integers
- #to takes a single integer and returns the sum
- ::to takes a single integer and return a sum
--- E
0 & (3,5) => 1
4 & (3,5) => 3
10 & (3,5) => 23
--- D
Input: integers
In-between: an array of integers
Output: integer
--- A
- Iterate from 1 up to, but not including, the first number
  - select all numbers divisible by any number in the set
  - sum the result
=end

class SumOfMultiples
  def initialize(*set)
    @set = set
  end

  def to(ceiling)
    (1...ceiling).select do |num|
      @set.any? { |divisor| num % divisor == 0 } 
    end.sum
  end

  def self.to(ceiling)
    set = SumOfMultiples.new(3, 5)
    set.to(ceiling)
  end
end
