=begin
It will raise an NameError as `greeting` is an undefined local variable.
The expression evaluated by the if conditional statement is `false`.
Therefore, the resulting code is not evaluated.
`"hello world"` does not get assigned to `greeting`.
=end

if false
  greeting = "hello world"
end

greeting
