=begin
--- A
- Initialize a range between 10 and 100
- Check if 42 is included in the range
=end

puts (10..100).include?(42)

# Alternative: (10..100).cover?(42)
# If begin and end are numeric, `#include?` behaves like `#cover?`
# Otherwise, use `#cover?` to ensure obj is between begin and end
