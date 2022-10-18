We can search the array `a` to find the first element whose value exceeds `8` using the following code:
```ruby
a.bsearch { |i| i > 8 }
```
The `Array#bsearch` method can be found in the documentation for the `Array` class.

`Array#bsearch` has two modes: the 'find minimum' mode and 'find-any' mode. In this case, since we only have one condition, we can use the 'find-minimum' mode to find the first element whose value exceeds `8`.

In 'find-minimum' mode, the block we pass to `#bsearch` must return a `true` or `false`. `#bsearch` returns the first element for which the block returns `true`. In this example, `#bsearch` will return `11` as it is the first element for which `i > 8` is `true`.