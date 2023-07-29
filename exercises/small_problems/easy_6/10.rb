# The code will print the elements `Moe`, `Larry`, `CURLY`, `SHEMP`, `Harpo`, `CHICO`, `Groucho`, and `Zeppo` on separate lines.
# The `#each` method call on line 8 adds a string object to `array2`.
# Both `array1` and `array2` reference the same string objects.
# Mutating the string objects by calling `#upcase!` within the block passed to the `#each` method call on line 9 mutates the string objects referenced by both arrays.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# To avoid mutating the original array referenced by `array2`, `array1` can be mutated to a new transformed array object.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.map! { |value| value.upcase if value.start_with?('C', 'S') }
puts array2
