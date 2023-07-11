=begin
--- P
Input:
- Array of whole numbers
Output:
- Same number of elements as original array
- Each element is the running total of the original array
Implicit rules:
- Elements do not have to be sorted.
- Numbers are positive
- Empty arrays result in an empty array as output
--- E
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
--- D
- Original array of numbers as input
- Array of running totals as output
--- A
- Set total = 0
- Iterate through the input array
- For each iteration,
  - Add the number in the current iteration to `total`
  - Return the total for each element
=end

# def running_total(number_array)
#   total = 0
#   number_array.map { |num| total += num }
# end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

=begin
Alternative using `Enumerable#each_with_object`:
def running_total(array)
  array.each_with_object([]) { |val, arr| arr << val + arr.last.to_i }
end

Alternative using `Enumerable#inject`:
def running_total(array)
  array.inject([]) { |arr, val| arr << val + arr.last.to_i }
  end
end

Alternative using `Enumerable#with_index`
def running_total(array)
  array.map.with_index { |_, i| array[0..i].sum }
=end
