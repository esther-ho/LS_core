=begin
--- P
Input: an integer, n
Output: the n-th Fibonacci number

Explicit rules:
- Write a procedural method to compute the n-th Fibonacci number without recursion

--- E
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

--- D
Input: an integer
In-between: an array of Fibonacci numbers until the n-th number
Output: an integer

--- A
- Find all numbers in the Fibonacci series from 1 to the n-th
  - Initialize an array with [1, 1]
  - Until the array is of n-length:
    - Sum the last two numbers in the array
    - Push the result into the array
- Return the n-th number
=end

def fibonacci(n)
  fibonacci_nums = [1, 1]

  while fibonacci_nums.size < n
    fibonacci_nums << fibonacci_nums[-2..-1].sum
  end
  
  fibonacci_nums[-1]
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
