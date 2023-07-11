=begin
The object ids of `a`, `b`, and `c` are the same.
`a` and `c` reference the same Number object, and are aliases.
Since Number objects are immutable, `b` references the same immutable integer `42` object.
No new Number object is created.
Any operation on an integer returns a new integer object.
`true`, `false`, and `nil` are also handled like immutable objects.
=end

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
