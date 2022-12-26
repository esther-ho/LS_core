=begin
--- P
Inputs:
- Two numbers
Output:
- Product of the input multiplied together

Implicit rules:
- Two numbers are given
--- E
multiply(5, 3) == 15
multiply(0, 4) == 0
multiply(7, 0) == 0
--- D

--- A
- Return the product of the two integers passed to the method
=end

def multiply(num1, num2)
  num1 * num2
end
# Using `*` operator can cause unexpected behaviors depending on left operand
# e.g. multiply('hi', 2) == 'hihi'
# e.g. multiply([1, 2], 2) == [1, 2, 1, 2]
# `Array#*` creates x copies of array and concatenates copies to the original

puts multiply(5, 3) == 15
puts multiply(0, 4) == 0
puts multiply(7, 0) == 0

# `Array#*` passes the reference value of all elements in the array to the method
# `#*` copies the elements and reference values and adds them to the array
arr = ['h','i']
puts "Original array: #{arr}"
puts "Original array object id: #{arr.object_id}"
puts "Original array, first element id: #{arr[0].object_id}"

modified_arr = multiply(arr, 2)
puts "Modified array: #{modified_arr}"
puts "Modified array object id: #{modified_arr.object_id}"
puts "Modified array, first element id: #{modified_arr[0].object_id}"
puts "Modified array, third element id: #{modified_arr[2].object_id}"

modified_arr[0].upcase!
puts "Modified array after #upcase: #{modified_arr}"
