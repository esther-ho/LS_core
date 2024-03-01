def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(el, i), result|
    result << [el, arr2[i]]
  end
end

# alternative with `#map`

def zip(arr1, arr2)
  (0...arr1.size).map { |i| [arr1[i], arr2[i]] }
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
