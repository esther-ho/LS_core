=begin
The object ids of both `a` and `c` will be the same.
Both `a` and `c` reference the same String object and are aliases.
`b` references a different String object, but its value matches `a` and `c`.
A new string is created because String objects are mutable.
=end

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
