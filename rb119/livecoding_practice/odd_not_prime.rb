# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

=begin
--- P
Determine the number of positive integers between 1 and the given integer that are odd and NOT prime. A prime number is greater than 1 and can only be divided by 1 and itself.

Input(s):
- A positive integer
Output(s):
- Count of numbers between 1 and given number that are odd and NOT prime
Explicit rules:
- Given number is an integer between 1 and 10000
Implicit rules:
- 1 is not a prime number
--- E
p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
--- D
Input: integer
In-between:
  - Reference array of all odd integers between 1 and given integer, inclusive
    - e.g. If given 15, find odd integers between 1 and 15
  - Reference array of all integers between 2 and the integer at an iteration, exclusive
    - e.g. If integer is 5, find all integers between 2 and 4
  - All integers in the reference array that are NOT prime
Output: integer
--- A
- Create a reference array of all odd integers between 1 and given integer
  - Iterate through a range of numbers from 1 to given integer
  - Add numbers to the reference array if they are odd
- Find the integers in the reference array besides 1 that are NOT prime 
  - Initialize an empty array 'not_prime'
  - Iterate through the reference array
      - Push the integer `1` into 'not_prime' if integer at current iteration is `1`
        - `1` is always odd and not prime
    - If the number at the current iteration is divisible by any numbers from 2 to the integer at the current iteration (excluding the current integer)
      - Push the number into 'not_prime' array
      - Exit the iteration
- Count the integers that are NOT prime and return the number of integers
  - Find the size of the 'not_prime' array
=end

def odd_not_prime(int)
  odd_ints = (1..int).each_with_object([]) { |i, arr| arr << i if i.odd? }

  not_prime = []

  odd_ints.each do |i|
    not_prime << i if i == 1

    (2..(i - 1)).each do |divisor|
      break not_prime << i if i % divisor == 0
    end
  end

  not_prime.size
end


p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
