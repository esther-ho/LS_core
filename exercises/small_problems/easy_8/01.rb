=begin
--- P
- Input: An array of integers
- Output: An integer which is the sum of the sum of each subsequence
- Explicit rules:
  - The array will always contain one number
- Implicit rules:
  - The array may not be ordered
  - Each subsequence starts from the element at index 1
    - It increases in length by 1 until all elements in the array are present in the subsequence
  - The array doesn't contain repeated elements
--- E
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

p sum_of_sums([3, 5, 2]) == 21
p sum_of_sums([1, 5, 7, 3]) == 36
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
--- D
- Input: an array of numbers
- Output: an integer

[3, 5, 2] -> 3 + (3 + 5) + (3 + 5 + 2) == 21
[4] -> 4 == 4
--- A
- Find all subsequences of the array, starting from the first index
  - Find the first subsequence with starting and ending index of 0
  - Increment the ending index by 1 for each subsequent element until the final index in the given array
- Sum of all elements in the subsequence
- Increment the total sum by the sum
=end

def sum_of_sums(numbers)
  numbers.each_index.inject(0) do |total, idx|
    total += numbers[0..idx].sum
  end
end

p sum_of_sums([3, 5, 2]) == 21
p sum_of_sums([1, 5, 7, 3]) == 36
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
