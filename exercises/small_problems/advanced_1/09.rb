=begin
--- P
Two methods
Input 1: rational number
- Number represented by the division of two integers
Output 1: an array containing numbers
- Numbers in the array are the denominator that make up the Egyptian Fraction representation of the given number

Input 2: an array containing numbers
- Numbers are the denominators of egyptian fractions
Output 2: the resulting rational number

Rules:
- An egyptian fraction is the sum of a series of distinct unit fractions
- Unit fractions are fractions where the numerator is 1
- Given rationals may be greater than 1

--- E
(2, 1) -> [1, 2, 3, 6]

2 -> 1/1 + 1/2 + 1/3 + 1/6

--- D
Input 1: a rational number
Output 2: an array of integers

Input 2: an array of integers
Output 2: a rational number

--- A
Method 1 (egyptian):
- Initialize a denominators array
- Find all possible unit fractions until the remainder is less than 1
- Add denominators to array
- While the remainder is not a single unit fraction
  - Find next largest unit fraction and add its denominator to the array
- Return the array

Method 2 (unegyptian):
- Convert each number in the array into its unit fraction
- Sum all unit fractions
=end

def egyptian(rational)
  denoms = []

  (1..).each do |denom|
    break if rational < 1

    rational -= Rational(1, denom)
    denoms << denom
  end

  return denoms if rational.zero?

  while rational.numerator > 1 || denoms.include?(rational.denominator)
    unit_fraction = rational.denominator / rational.numerator
    last_num = (denoms.empty? ? 1 : denoms.last)
    denom = (last_num.succ..).find { |n| n > unit_fraction }
    rational -= Rational(1, denom)
    denoms << denom
  end

  denoms << rational.denominator
end

def unegyptian(denoms)
  denoms.map { |denom| Rational(1, denom) }.sum
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
