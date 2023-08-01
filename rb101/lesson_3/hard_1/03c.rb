=begin
The following code will be the output:
"one is: two"
"two is: three"
"three is: one"

The reference values for "one", "two", and "three" are passed to the method.
These values are assigned to the method local variables `one`, `two`, `three`.
`String#gsub!` is a destructive method that mutates the referenced object.
The local variables outside the method now reference the mutated object.
=end

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
