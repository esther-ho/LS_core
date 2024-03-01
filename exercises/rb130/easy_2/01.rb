def step(first, last, step_value)
  nums = [first]

  loop do
    yield(nums[-1])
    next_num = nums[-1] + step_value
    break if next_num > last
    nums << next_num
  end

  nums
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
