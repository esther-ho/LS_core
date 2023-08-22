=begin
--- P
Input: two integers; one is the starting number and one is the ending number
Output: Print an integer, "Fizz", "Buzz", or "FizzBuzz" to the screen

Explicit rules:
- Print "Fizz" if the integer is divisible by 3
- Print "Buzz" if the integer is divisible by 5
- Print "FizzBuzz" if the integer is divisible by both 3 & 5
- Else, print out the integer

--- E
p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

--- D
Input: two integers
In-between: an array of all integers beginning from the starting integer to the ending integer
Output: print out integers, "Fizz", "Buzz", or "FizzBuzz"

--- A
- Create a collection of all numbers from starting number to ending number
- For every number in the collection, check if the number is divisible by 3 and 5
  - If it is divisible by both 3 and 5, print "FizzBuzz"
  - If it is divisble by only 3, print "Fizz"
  - If it is divisible by only 5, print "Buzz"
  - Else, print the number
=end

def fizzbuzz(first_num, last_num)
  (first_num..last_num).to_a.map do |num|
    if num % 3 == 0 && num % 5 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num
    end
  end.join(', ')
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
