=begin
--- P
Input:
- A whole number
Output:
- Multiples of 3 or 5 between 1 and input number
- Sum of the multiples
Explicit rules:
- Input whole number should be greater than 1
Implicit rules:
- Multiples can include input number
- Multiples for both 3 and 5 are not repeated
  - e.g. 15 only counted once
--- E
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
--- D
- Store relevant multiples in an array
--- A
- Create an empty array called `multiples`
- Initialize a range from 1 to input number
- Iterate through the range
- For each iteration,
  - If the number is divisible by 3, or divisible by 5
    - Push the number into the `multiples` array
- Sum the multiples in the array
=end

def multisum(number)
  multiples = []
  (1..number).each do |num|
    multiples << num if num % 3 == 0 || num % 5 == 0
  end

  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
