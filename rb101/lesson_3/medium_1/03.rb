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

puts factors(0)

=begin
- If the input is `0` or negative, `factors` will return an empty array.
1. `number % divisor == 0` ensures that `number` is divisible by `divisor`
  - It is divisible if the modulus is `0`
2. The last line ensures that the value of `factors` is returned by the method
  - There is no explicit `return` statement
  - Therefore, the return value is based on the last statement executed
  - In this case, the return value of the `while` loop is `nil`
=end
