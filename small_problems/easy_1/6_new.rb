=begin
--- P
Inputs:
- Positive whole number, n
Outputs:
- Print a triangle shape formed using `*`
  - The sides each have n stars
  - The hypothenus should be from upper-right to bottom-left
Implicit rules:
- The given number should be > 1 to form a triangle
- The area not filled with * should be spaces
--- E
triangle(5)

    *
   **
  ***
 ****
*****
--- D

--- A
- For each iteration,
  - Print (n - iteration) of spaces and iteration *
=end

def triangle(number)
  (1..number).each do |iteration|
    puts (" " * (number - iteration)) + ('*' * iteration)
  end
end

triangle(5)
triangle(9)
