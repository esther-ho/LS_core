=begin
It will raise an NameError as `greeting` is an undefined local variable.
The expression evaluated by the if conditional statement is `false`.
Therefore, the resulting code is not evaluated.
`"hello world"` does not get assigned to `greeting`.

Initializing a local variable within an `if` clause will initialize it to `nil`.
This happens even if the `if` clause doesn't get executed.
Therefore, `greeting` here is `nil`.
=end

if false
  greeting = "hello world"
end

greeting
