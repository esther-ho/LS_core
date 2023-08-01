# This code would output `1` and `3`.
# Since the first element is removed on every iteration, the index of the remaining elements would be reduced by 1.
# `#each` stops iterating when numbers.size == 2 since there are no elements at index 2
# `#each` returns the mutated array `[3, 4]`

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# The code would output `1` and `2`.
# Since the last element is removed on every iteration, `#each` iterates fewer times than the initial array size.
# `#each` stops iterating when numbers.size == 2 since there is no element at index 2
# `#each` returns the mutated array `[1, 2]`

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
