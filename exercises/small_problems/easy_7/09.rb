=begin
--- P
Input(s):
- Two arrays containing numbers
Output(s):
- A new array sorted by increasing value that contains the product of every pair of numbers formed between the numbers of the two arrays
Explicit rules:
- Neither array is empty
Implicit rules:
- Arrays do not have to be of the same size
--- E
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
--- D
- Two input arrays containing numbers that may be of different sizes
- One output array with product ordered in increasing value
--- A
- Iterate through first array
- Iterate through second array
- For each iteration,
  - Multiply the element from the first array
  - Push the result to the results array
- Flatten the array
- Sort the array in increasing order
- Return the array
=end

def multiply_all_pairs(arr1, arr2)
  arr1.flat_map do |n1|
    arr2.map { |n2| n1 * n2 }
  end.sort
end

# Alternative 2:
# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map { |n| n.reduce(:* )}.sort
# end

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
