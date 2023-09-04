=begin
--- P
Input: an unsorted array
Output: the given array mutated - now sorted

Rules:
- On each iteration, a pair of consecutive elements is compared
  - If the first element is greater than the second, the two elements are swapped
- Multiple iterations are repeated until all elements cannot be swapped
- Given array contains at least 2 elements

--- E
[5, 3] -> [3, 5]

[6, 2, 7, 1, 4] -> [2, 6, 1, 4, 7] -> [2, 1, 4, 6, 7] -> [1, 2, 4, 6, 7]

--- D
Input: an unsorted array
Output: a sorted array

--- A
- Set a variable to track if any elements are swapped
- Check if every consecutive pair of elements needs to be swapped
  - If the first element is larger, swap both elements
  - Set variable `swapped` to `true`
- Iterate over the array until no more swaps are made for the entire round of iterations
=end

def bubble_sort!(array)
  swapped = true

  while swapped
    swapped = false
    
    (0...array.size).each do |i|
      if (array[i] <=> array[i + 1]) == 1
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end
  end
end

# Further exploration

# def bubble_sort!(array)
#   1.upto(array.size - 1) do |sorted_end|
#     swapped = false

#     (0...array.size - sorted_end).each do |i|
#       if (array[i] <=> array[i + 1]) == 1
#         array[i], array[i + 1] = array[i + 1], array[i]
#         swapped = true
#       end
#     end

#     break if array.size - 1 == sorted_end || !swapped
#   end
# end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
