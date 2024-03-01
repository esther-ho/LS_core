def one?(collection)
  counter = 0
  collection.each do |item|
    counter += 1 if yield(item)
    return false if counter > 1
  end

  counter == 1
end

puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
puts one?([1, 3, 5, 7]) { |value| true }           # -> false
puts one?([1, 3, 5, 7]) { |value| false }          # -> false
puts one?([]) { |value| true }                     # -> false
