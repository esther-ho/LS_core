flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.map.with_index do |name, i|
  [name, i]
end.to_h
