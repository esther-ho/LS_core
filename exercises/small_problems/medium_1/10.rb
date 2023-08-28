=begin
--- P
Input: an integer, n
Output: an integer, which is the last digit of the n-th Fibonacci number

Explicit rules:
- Return the last digit of the n-th Fibonacci number
- Use the procedural method of finding the n-th Fibonacci number

--- E
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

--- D
Input: an integer
In-between: an array of the last two numbers in the Fibonacci series
Output: an integer

--- A
- Find the n-th Fibonacci number
  - Sum all previous Fibonacci numbers (starting from 1 and 1) to get the n-th number
- Find the last digit of the Fibonacci number
  - Convert the number into a string
  - Find its last character
  - Convert the character to an integer
=end

def fibonacci_last(n)
  first, last = [1, 1]

  3.upto(n) do
    first, last = [last, first + last]
  end

  p last.to_s[-1].to_i
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4

