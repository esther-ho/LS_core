=begin
--- P
Input: integer
Output: string ('perfect', 'abundant', 'deficient') or raise error
Rules:
- Integer has to be positive
- Output string depends on the aliquot sum
  - Aliquot sum is the sum of all positive divisors of the given number
  - If aliquot sum > given number => 'perfect'
  - If aliquot sum == given number => 'abundant'
  - If aliquot sum < given number => 'deficient'
- The given number itself is not a divisor
Class needs:
- ::classify takes an integer and returns a string
--- E
6 => 'perfect' # (1 + 2 + 3) == 6 
28 => 'perfect' # (1 + 2 + 4 + 7 + 14) == 28
15 => 'deficient' # (1 + 3 + 5) == 9
24 => 'abundant' # (1 + 2 + 3 + 4 + 6 + 8 + 12) == 36
7 => 'deficient'
--- D
Input: integer
In-between: array of integers
Output: string
--- A
- Raise StandardError if non-positive integer is given
- Find divisors for given number
  - Iterate through 1 to numbers half of the original number (numbers more than half of the original number can't be divisors)
    - If given number is divisible by number at current iteration, select the current number
- Sum divisors
- Compare sum to given number
  - If sum is equal to given number, return 'perfect'
  - If sum is greater than given number, return 'abundant'
  - If sum is less than given number, return 'deficient'
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError, "Number must be positive." if number < 1
    case sum_of_divisors(number) - number
    when 0    then 'perfect'
    when 1..  then 'abundant'
    else           'deficient'
    end
  end

  def self.sum_of_divisors(number)
    (1..number / 2).select do |divisor|
      number % divisor == 0
    end.sum
  end
end
