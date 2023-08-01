=begin
The last line will output "{:a=>"hi there"}".
`informal_greeting` references the String object in the hash's k-v pair.
Using `#<<` concatenates ' there' to the String object and mutates it.
`greetings` references the hash containing the same String object.
Therefore, the value of the k-v pair in the hash is modified.

Modifying `informal_greeting` without modifying `greetings`:
1. Initalize `informal_greeting` to reference a new object with the same value.
- `informal_greeting = greetings[:a].clone`
2. String concatenation which returns a new String object
-`informal_greeting += ' there'`

=end

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting # => "hi there"
puts greetings
