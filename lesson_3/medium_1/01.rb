# Print the string 10 times, with each line indented 1 space to the right

10.times { |n| puts "The Flintstones Rock!".prepend(' ' * n) }

# Alternative
# 10.times { |n| puts (' ' * n).concat("The Flintstones Rock!") }
