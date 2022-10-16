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