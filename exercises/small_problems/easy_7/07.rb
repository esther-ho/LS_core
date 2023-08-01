=begin
--- P
Input(s):
- An array of integers
Output(s):
- A single integer which is a result of:
  - Multiplying all numbers together
  - Dividing the result by number of integers
  - Round the result to 3 decimal places
Explicit rules:
- Array is non-empty
Implicit rules:
- Return a string where the result is interpolated into the string "The result is ..."
--- E
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
--- D
- Input array of integers
--- A
- Multiply all integers in the array
- Divide the sum by the array size
- Round the result to 3 decimal places
- Result is interpolated into the string "The result is ..."
=end

def show_multiplicative_average(num_arr)
  result = num_arr.inject(:*).to_f / num_arr.size

  "The result is #{format('%.3f', result)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
