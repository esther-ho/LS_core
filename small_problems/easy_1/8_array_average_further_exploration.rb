=begin
--- P
Input:
- An array containing one or more whole numbers greater than 0
Output:
- A single float that is the average of all the numbers in the given array
  - The average is the sum of all integers divided by the number of integers
  - A float is a number with a decimal point

Implicit rules:
- The array does not have to be ordered
- The array can contain one or more whole numbers
- The output will be a decimal point number greater than 0

--- E
puts average([1, 6]) == 3.5 # float division: (1 + 6) / 2 -> 3.5
puts average([1, 5, 87, 45, 8, 8]) == 25.67
puts average([9, 47, 23, 95, 16, 52]) == 40.34

--- D
The input is provided as an array of whole numbers

--- A
- Sum all numbers in the array
- Convert the sum into a floating point number
- Divide the sum by the size of the array
- Round the result to the smallest number larger than or equal to the floating point number, to the nearest two decimal place number

=end

def average(numbers)
  (numbers.sum.to_f / numbers.size).ceil(2)
end

puts average([1, 6]) == 3.5 # float division: (1 + 6) / 2 -> 3.5
puts average([1, 5, 87, 45, 8, 8]) == 25.67
puts average([9, 47, 23, 95, 16, 52]) == 40.34
