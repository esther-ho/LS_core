flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones
p flintstones.flatten

# `Array#flatten!` will mutate the original array
p flintstones
flintstones.flatten!
p flintstones
