# Change the loop without using `begin/end until`

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

=begin
1. `number % divisor == 0` ensures that `number` is divisible by `divisor`
  - It is divisible if the modulus is `0`
2. The last line ensures that the value of `factors` is returned by the method
  - Otherwise, the return value will be based on the loop if it's the final line
=end
