`my_method(4, 5, 6)` will print `[4, 5, 3, 6]`.

This behavior is due to the use of *default positional arguments*, which are described in the 'Calling Methods' page in the Ruby documentation.

When the method defines default arguments, we do not need to supply all arguments to the method. Ruby will fill in the missing arguments in order.

In simple cases when default arguments appear on the right, Ruby fills in the missing arguments from left to right, e.g:
```ruby
def my_method(a, b, c = 3, d = 4)
  p [a, b, c, d]
end

my_method(1, 2)    #=> [1, 2, 3, 4]
my_method(1, 2, 5) #=> [1, 2, 5, 4]
```

When default arguments appear in the middle of positional arguments, Ruby assigns the first and last arguments that do not have default values. The remaining arguments will default values are then assigned from left to right, e.g:
```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(1, 4)    #=> [1, 2, 3, 4]
my_method(1, 5, 6) #=> [1, 5, 3, 6]
```