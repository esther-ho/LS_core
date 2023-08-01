# Use a combination of methods (including either `#select` or `#reject`) to return a new identical array containing only integers that are multiples of 3

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr.map do |subarr|
  subarr.select { |i| i % 3 == 0 }
end
