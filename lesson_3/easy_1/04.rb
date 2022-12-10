=begin
Both methods are destructive.

`Array#delete_at` deletes the element at the index indicated by the argument.
Therefore, `numbers.delete_at(1)` will return `2`.
`numbers` will reference the array `[1, 3, 4, 5]`.

`Array#delete` deletes all elements matching the argument.
Therefore, `numbers.delete(1)` will return 1.
`numbers` will reference the array `[2, 3, 4, 5]`.
=end

numbers = [1, 2, 3, 4, 5]
puts numbers.delete_at(1)
puts numbers.inspect

numbers = [1, 2, 3, 4, 5]
puts numbers.delete(1)
puts numbers.inspect
