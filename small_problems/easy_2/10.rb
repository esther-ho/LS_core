=begin
- "Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", \
  "Groucho", and "Zeppo" will be printed on seperate lines.
- The first #each method copies each element in `array1` into `array2`.
  - `array2` references a different array from `array1` but,
  - It contains the same String objects as array1
  - `array1` is remains unchanged
- The second #each method mutates the String objects in `array1`
  - 'Curly'->'CURLY', 'Shemp' -> 'SHEMP', 'Chico' -> 'CHICO'
  - Although `array2 `references a different array,
  - Strings in `array2` are the same String objects and are mutated
- To avoid unintentionally mutating objects, using non-mutating methods
  - e.g use `#upcase` rather than `#upcase!`
  - e.g use `#map!` instead of `#each`
    - `#map!` replaces each element with the value returned from the block
  - e.g reassign the array
=end

system 'clear'

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []

puts '>>> Initialize arrays'
puts "array1: #{array1.inspect}"
puts "array1 ID: #{array1.object_id.inspect}"
puts "array2: #{array2.inspect}"
puts "array2 ID: #{array2.object_id.inspect}"
puts "array1 val #3 ID: #{array1[2].object_id.inspect}", ''

array1.each { |value| array2 << value }

puts '>>> Copy String objects'
puts "array1: #{array1.inspect}"
puts "array1 ID: #{array1.object_id.inspect}"
puts "array2: #{array2.inspect}"
puts "array2 ID: #{array2.object_id.inspect}"
puts "array1 val #3 ID: #{array1[2].object_id.inspect}"
puts "array2 val #3 ID: #{array2[2].object_id.inspect}", ''

array1.each { |value| value.upcase! if value.start_with?('C', 'S') }

puts '>>> Mutate String objects'
puts "array1: #{array1.inspect}"
puts "array1 ID: #{array1.object_id.inspect}"
puts "array2: #{array2.inspect}"
puts "array2 ID: #{array2.object_id.inspect}"
puts "array1 val #3 ID: #{array1[2].object_id.inspect}"
puts "array2 val #3 ID: #{array2[2].object_id.inspect}", ''

array1.map!(&:capitalize)

puts '>>> Mutate array1 but not the String objects'
puts "array1: #{array1.inspect}"
puts "array1 ID: #{array1.object_id.inspect}"
puts "array2: #{array2.inspect}"
puts "array2 ID: #{array2.object_id.inspect}"
puts "array1 val #3 ID: #{array1[2].object_id.inspect}"
puts "array2 val #3 ID: #{array2[2].object_id.inspect}"

array1 = array1.map(&:downcase)

puts '>>> Re-assign array1'
puts "array1: #{array1.inspect}"
puts "array1 ID: #{array1.object_id.inspect}"
puts "array2: #{array2.inspect}"
puts "array2 ID: #{array2.object_id.inspect}"
puts "array1 val #3 ID: #{array1[2].object_id.inspect}"
puts "array2 val #3 ID: #{array2[2].object_id.inspect}"
