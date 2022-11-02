=begin
--- P
Input:
- An array containing one or more whole numbers greater than 0
Output:
- A single integer that is the average of all the numbers in the given array
  - The average is the sum of all integers divided by the number of integers

Implicit rules:
- The array does not have to be ordered
- The array can contain one or more whole numbers
- The output will be a whole number greater than 0

--- E
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

--- D
The input is provided as an array of whole numbers

--- A
- Sum all numbers in the array
- Divide the sum by the size of the array
- Return the result

=end

def average(numbers)
  numbers.sum / numbers.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
