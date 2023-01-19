=begin
--- P
Input:
- The whole number which represents:
  - Number of digits of the Fibonacci number
Output:
  - The index of the first Fibonacci number with the corresponding p of digits
Explicit rules:
- The given p of digits will be 2 or greater
- The index of the 1st Fibonacci number is 1
Implicit rules:
- The input will be a valid integer
- There will be a Fibonacci number with the given p of digits
--- E
find_fibonacci_index_by_length(2) == 7          p 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         p 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
--- D
- Store Fibonacci numbers in order in an array
--- A
- Initialize a starting array of `[1, 1]` as the Fibonacci numbers
- Create a loop that:
  - Sums the last two numbers of the array
  - Pushes the sum into the array
  - Breaks if the number of digits of the last number equals the input
- Return the index of the last number
=end

def find_fibonacci_index_by_length(digits)
  fibonacci_nums = [1, 1]
  until fibonacci_nums[-1].to_s.size == digits
    fibonacci_nums << fibonacci_nums[-2, 2].sum
  end
  fibonacci_nums.size
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
