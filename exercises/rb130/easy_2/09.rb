# Write a method called each_cons that behaves similarly for Arrays, taking the elements 2 at a time. The method should take an Array as an argument, and a block. It should yield each consecutive pair of elements to the block, and return nil.

def each_cons(collection)
  collection.each_with_index do |item, i|
    break if i == collection.size - 1
    yield(item, collection[i + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
puts result == nil
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
puts hash == {}
puts result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
puts hash == {'a' => 'b'}
puts result == nil
