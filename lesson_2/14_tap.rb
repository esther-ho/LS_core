# Using `Object#tap` for debugging.
# `Object#tap` passes the object it was called on to the block.
# It then returns the object it was called on.


'Hello World'                         .tap { |x| puts "original: #{x}" }
  .chars                              .tap { |x| puts "characters: #{x}" }
  .filter { |x| x != ' ' }            .tap { |x| puts "without spaces: #{x}" }
  .map(&:downcase)                    .tap { |x| puts "lowercase: #{x}" }
  .uniq                               .tap { |x| puts "unique characters: #{x}" }
