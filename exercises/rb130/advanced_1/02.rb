# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
# Procs have leniet arity.
# Executing the code on line 5 doesn't raise an error even though no arguments were passed to `my_proc`.
# Instead, the `thing` variable in the proc references `nil`.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# Lambdas have strict arity.
# Although it is an object of the Proc class, unlike a proc, it requires the exact number of arguments to be passed in that the lambda expects.
# Executing the code on line 18 raises an ArgumentError since no arguments were passed to `my_lambda`.
# Executing the code on line 19 raises a NameError as there is no Lambda class. Instead, lambdas are instances of the Proc class.

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }
block_method_1('seal')
# Blocks have lenient arity.
# Since the local variable `animal` in the method definition is not passed to the block, the local variable `seal` in the block references `nil`.
# Executing the code on line 31 raises a `LocalJumpError` as `yield` is invoked in the method definition, but a block was not passed in during method invocation.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}." }
# Blocks have lenient arity.
# When executing the code on line 42 - 44, only one argument is passed to the block. Therefore, the local variable `seal` references `nil`.
# Executing the code on line 45 raises a NameError. This shows that the method definition and the block passed in do not share the same scope.
