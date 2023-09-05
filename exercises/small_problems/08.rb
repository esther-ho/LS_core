=begin
--- P
Input: an array containing one type of data
- might be strings or numbers
Output: an array sorted using recursion

Rules:
- Arrays are split into their nested subarrays
- Subarrays are recombined in sorted order
- Arrays may contain odd or even number of elements

--- E
[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]

[6, 2, 7, 1, 4] ->
[[6, 2], [7, 1, 4]] ->
[[[6], [2]], [[7], [1, 4]] ->
[[[6], [2]], [[7], [[1], [4]]]] ->
[[2, 6], [[7], [1, 4]]] ->
[[2, 6], [1, 4, 7]] ->
[1, 2, 4, 6, 7]

--- D
Input: an unsorted array
In-between:
  - subarrays containing element(s)
Output: a sorted array

--- A
- Split array into pairs until the nested subarray contains only one element
- Sort the pairs using the list sort method
  - Track the index of the second array
  - Iterate through the first array
    - If the stored index is smaller than the size of the second array
      - Add the element in the second array to the results array if the value in the second array is smaller than the value of the first array
      - Otherwise, add the value of the first array
=end

def merge_sort(array)
  mid = array.size / 2

  return array if mid == 0

  arr1, arr2 = merge_sort(array[0...mid]), merge_sort(array[mid..-1])

  merge(arr1, arr2)
end

def merge(arr1, arr2)
  results = []
  index2 = 0

  arr1.each do |el|
    if index2 < arr2.size
      while (el <=> arr2[index2]) == 1
        results << arr2[index2]
        index2 += 1
      end
    end

    results << el
  end

  results.concat(arr2[index2..-1])
end

# Further exploration

# def merge_sort(array)
#   length = 1

#   while length < array.size
#     result = []

#     0.step(by: length * 2, to: array.size - 1) do |i|
#       el1 = array[i, length]
#       el2 = array[i + length, length]

#       if [el1, el2].any?(nil)
#         result << [el1, el2].compact
#         break
#       end
      
#       result << merge(el1, el2)
#     end

#     array = result.flatten
#     length *= 2
#   end

#   array
# end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
