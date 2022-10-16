Both methods can be found on the documentation page for the `File` class.

`File::path` is a class method as denoted by `::`. It returns the string representation of the path.
Example:
```ruby
File.path("/dev/null") #=> "/dev/null"
```
It is called directly on the `File` class.

`File#path` is an instance method as denoted by `#`. It returns the pathname used to create *file* as a string.
Example:
```ruby
File.new("testfile").path #=> "testfile"
```
It is called on the object of the `File` class.

More examples:
```ruby
# Class method
puts File.path('bin')

# Instance method
f = File.new('my-file.txt')
puts f.path
```
In the above examples, the class method `File::path` is called directly on the `File` class. However, the instance method `File#path` is called on `f`, the object of the `File` class.
