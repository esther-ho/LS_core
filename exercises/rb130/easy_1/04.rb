def divisors(num)
  (2..num.to_f / 2).each_with_object([1, num]) do |divisor, result|
    quotient, remainder = num.divmod(divisor)
    result.push(divisor, quotient) if remainder == 0
  end.uniq.sort
end

puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# With square root as the midway point

def divisors(num)
  (1..(num ** 0.5).to_i).each_with_object([]) do |divisor, result|
    quotient, remainder = num.divmod(divisor)
    result.push(divisor, quotient) if remainder == 0
  end.uniq.sort
end

puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
