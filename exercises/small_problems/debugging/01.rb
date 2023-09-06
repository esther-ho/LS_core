def decrease(counter)
  counter - 1
end

counter = 10

# Execute loop until counter == 0
until counter.zero?
  puts counter
  # The return value of the `decrease` method call needs to be saved
  counter = decrease(counter)
end

puts 'LAUNCH!'
