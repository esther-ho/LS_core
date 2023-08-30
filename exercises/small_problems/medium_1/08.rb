=begin
--- P
Input: an integer, n
Output: the n-th Fibonacci number
- A Fibonacci number is the sum of the two previous numbers

Explicit rules:
- The Fibonacci series begins with 1 and 1
- Each number in the series is a sum of the two previous numbers
- The method should be recursive
  - The method should only call itself once
  - It should have a condition to stop recursing
  - It should use the return value of the recursive call
- The Fibonacci number returned should be the 'nth' number
  - n is the argument passed to the method

Implicit rules:
- All numbers in the Fibonacci series are positive integers

--- E
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

[1, 1, 2, 3, 5]
3: 1 + 1 => 2
4: 1 + 2 => 3
5: 2 + 3 => 5

--- D
Input: an integer
Output: an integer

--- A
- Find all the Fibonacci numbers up to the n-th integer
  - Initialize the conditional to return 1 if n is 1 or 2
  - If n is not 1 or 2:
    - Sum the previous two Fibonacci numbers
- Return the n-th integer
=end

def fibonacci(n)
  return 1 if n <= 2

  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
