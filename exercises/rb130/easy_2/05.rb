def drop_while(collection)
  result = collection.clone
  while !result.empty?
    break unless yield(result[0])
    result.shift if yield(result[0])
  end
  result
end

# Alternative using index

def drop_while(collection)
  i = 0
  while i < collection.size && yield(collection[i])
    i += 1
  end

  collection[i..-1]
end

puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []
