=begin
--- P
Input: an array of integers
Output: the average of all the integers

Explicit rules:
- Do not use `Array#sum`
- Arrays will contain at least a single integer
- All integers will be positive
- Average should be an integer

--- E
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

--- D
Input: an array of integers
Output: a single integer - the average of all the integers

--- A
- Calculate the total sum of all the integers in the array
  - Initialize a variable `sum` with the value `0`
  - Iterate through the arrays of integers
    - Increment `sum` by the value of each integer
- Calculate the average of all the integers
  - Divide `sum` by the number of integers

=end

def average(numbers)
  sum = 0
  numbers.each { |num| sum += num }
  sum / numbers.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
