```ruby
puts s.public_methods(false).inspect
```

`#public_methods` can be found in the documentation for the `Object` class, which is the parent class of the `String` class.

The signature for `#public_methods` is:
`public_methods(all=true) → array`

The signature shows that `#public_methods` accepts one optional argument `all`. If no argument is passed to the method, the default value for `all` is `true`. This returns a list of public methods accessible to the caller object (in this case, the string `s`) including methods inherited from its parent classes.

By passing `false` to `#public_methods`, it returns a list of *only* the methods that are accessible to the caller object.