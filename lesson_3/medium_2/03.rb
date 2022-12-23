=begin
When a reference value is passed, the method initializes a new local variable.
Both reference values are assigned to new local variables (string and array).

The local variable `a_string_param` in the method is an alias for `my_string`.
- They reference the same String object.
In the method, `a_string_param` gets reassigned to a new String object.
- `#+=` creates a new String object and binds `a_string_param` to it.
- The new String object is "pumpkinsrutabaga".
`a_string_param` and `my_string` point to difference objects.
The original String is not modified.
- `my_string` still references "pumpkins".

The local variable `an_array_param` is an alias for `my_array`.
- They reference the same Array object.
In the method, `an_array_param` gets mutated using `#<<`.
- `#<<` appends a new element to the array.
`my_array_param` and `my_array` still point to the same object.
The original Array is modified.
- `my_array` references `["pumpkins", "rutabaga"]`.
=end

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
