=begin
The object ids of `a`, `b`, and `c` are the same.
`a` and `c` reference the same Number object, and are aliases.
Since Number objects are immutable, it also gets assigned to `b`.
No new Number object is created.
=end

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
