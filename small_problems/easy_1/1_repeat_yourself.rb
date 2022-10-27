=begin
Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates

# repeat('Hello', 3) # => Prints 'Hello' on a new line 3 times

----- P
Inputs: A single string, and a positive whole number

Output: The given string printed to the screen 'integer'-number of times

Implicit rules:
- The string is printed on a new line each time
- The method does not mutate the string
- The return value is not important.

----- E
repeat('Hello', 3) => Prints 'Hello' on a new line 3 times
repeat('Hello world', 5) => Prints 'Hello world' on a new line 5 times

----- D

----- A
- Set a counter to count the iterations as 1
- While the counter is less than or equal to the given positive number,
  - Print the given string
  - Increment the counter by 1
  
=end

def repeat(string, number)
  counter = 1

  while counter <= number
    puts string
    counter += 1
  end
end

repeat('Hello', 3)
repeat('Hello world', 5)
