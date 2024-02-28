def missing(nums)
  result = []
  return result if nums.size == 1

  (nums[0]..nums[-1]).each do |num|
   result << num unless nums.include?(num)
  end

  result
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []

# Method without using blocks

def missing(nums)
  (nums[0]..nums[-1]).to_a - nums
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
