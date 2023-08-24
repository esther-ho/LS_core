=begin
--- P
Input: an integer
Output: an array of integers, from 1 to given number

Explicit rules:
- The given integer will be greater than 0
- The array is sorted from smallest to largest

--- E
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

--- D
Input: an integer
In-between: a range of integers from 1 to given integer
Output: an array of integers

5 -> 1..5 -> [1, 2, 3, 4, 5]

--- A
- Find all the integers from 1 to the given integer
- Return all the integers in an array
=end

def sequence(last_num)
  (1..last_num).to_a
end

# Further exploration

# def sequence(number)
#   number.positive? ? (1..number).to_a : (number..1).to_a.reverse
# end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
# p sequence(-3) == [1, 0, -1, -2, -3]
