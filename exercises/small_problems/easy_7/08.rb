=begin
--- P
Input(s):
- TWo arrays containing the same number of integers
Output(s):
- A new array where each element is a product of each pair of numbers from each subarray with the same index
Explicit rules:
- Each array has the same number of elements
Implicit rules:
--- E
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
--- D
- Input arrays containing integers
- New output array which contains the product of each integer pair
--- A
- Create a new array where each subarray contains a pair of integers of the same index
- Multiply the pair of integers together and return the product
- Return the new array
=end

def multiply_list(arr1, *arrs)
  arr1.zip(*arrs).map { |n| n.inject(:*) }
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
multiply_list([1, 2], [2, 3], [3, 4]) == [6, 24]

# Alternative when dealing with arrays of different lengths:
# def multiply_list(arr1, *arrs)
#   max_size = [arr1, *arrs].map(&:size).max
#   if max_size > arr1.size
#     arr1 = arr1.dup
#     (max_size - arr1.size).times { arr1 << 0 }
#   end

#   arr1.zip(*arrs).map do |nums|
#     if nums.include?(nil)
#       puts "Warning: Arrays are not of equal length!"
#       nums.map! { |n| n ? n : 0 }
#     end

#     nums.reduce(:*)
#   end
# end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
# p multiply_list([1, 2], [2, 3], [3, 4]) == [6, 24]
# p multiply_list([1, 2], [2, 3, 4], [4, 5]) == [8, 30, 0]

