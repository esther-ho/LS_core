flintstones = {
  "Fred" => 0,
  "Wilma" => 1,
  "Barney" => 2,
  "Betty" => 3,
  "BamBam" => 4,
  "Pebbles" => 5
}

# Obtain an array with only Barney's name and number
# `Array#assoc` return the k-v pair if argument == key
p flintstones.assoc('Barney')
