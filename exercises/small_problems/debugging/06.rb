def move(n, from_array, to_array)
  # there is no base case so `move` will keep be executed in the next line
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# If length of `from_array` is smaller than `n`, the `to_array` will contain `nil`s
todo = ['study']
done = ['go to the beach']

move(2, todo, done)
p todo # []
p done # ['go to the beach', 'study', nil]
