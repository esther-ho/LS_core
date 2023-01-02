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

def triangle(side)
  (1..side).each do |iteration|
    puts (" " * (side - iteration)) + ('*' * iteration)
  end
end

def upsidedown_triangle(side)
  (0..(side - 1)).each do |iteration|
    puts ('*' * (side - iteration)) + (' ' * iteration)
  end
end

def triangle_2(side)
  (1..side).each do |iteration|
    puts ('*' * iteration) + (" " * (side - iteration)) 
  end
end

def upsidedown_triangle_2(side)
  (0..(side - 1)).each do |iteration|
    puts (' ' * iteration) + ('*' * (side - iteration))
  end
end

triangle(5)
triangle(9)

upsidedown_triangle(5)
upsidedown_triangle(9)

triangle_2(5)
triangle_2(9)

upsidedown_triangle_2(5)
upsidedown_triangle_2(9)
