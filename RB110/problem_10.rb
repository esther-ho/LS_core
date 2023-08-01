# Use `#map` to return a new array identical to original with each integer incremented by 1

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hash|
  hash.each_with_object({}) { |(k, v), hsh| hsh[k] = v + 1 }
end

# Alternative
arr.map do |hash|
  hash.transform_values { |v| v + 1 }
end
