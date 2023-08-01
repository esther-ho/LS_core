=begin
The following code will be the output:
"one is: one"
"two is: two"
"three is: three"

The reference values for "one", "two", and "three" are passed to the method.
These values are assigned to the method local variables `one`, `two`, `three`.
However, these local variables are reassigned to other reference values.
Reassignment does not mutate the objects that were referenced originally.
The local variables outside the method reference the original objects.
=end

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
