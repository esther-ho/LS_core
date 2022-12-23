=begin
Similar to 03a.
The following code will be the output:
"one is: one"
"two is: two"
"three is: three"

Instead, within the method, the local variables are assigned to objects.
Reassignment does not mutate the objects that were referenced originally.
Therefore, the local variables outside the method reference the same objects.
=end

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
