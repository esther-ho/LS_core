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
repeat('Print this string 2 times!', 2) => Print 'Print this string 2 times' on a new line 2 times

----- D

----- A
- Iterate through a block that prints the string as many times as specified by the integer

=end

def repeat(string, number)
  number.times { puts string }
end

repeat('Hello', 3)
repeat('Hello world', 5)
repeat('Print this string 2 times!', 2)
