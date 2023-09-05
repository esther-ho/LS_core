def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  # The return value of the `decrease` method call needs to be saved
  counter = decrease(counter)
end

puts 'LAUNCH!'
