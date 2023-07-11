```ruby
puts a.min(2)
# 3
# 5
# a.min(2) returns [3,5]
```

`#min` can be found in the documentation for the `Enumerable` module, which is an included module in the `Array` class.

`#min` returns the object in the enumerable object, the `Array` in the example with the minimum value. It assumes all objects being evaluated implement the `Comparable` mixin. As the `Numeric` class includes the `Comparable` mixin, `#min` can be called on an array containing integers.

`#min` has several signatures. The one we're interest in is:
`min(n) → array`

The signature shows that `#min` returns the minimum `n` values in the form of an array. Therefore, if `2` is passed to `#min` as an argument for `n`, `#min` will return the two smallest values in the array ordered from smallest to largest.