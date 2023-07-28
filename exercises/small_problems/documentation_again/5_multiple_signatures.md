```
# puts a.fetch(7)
Raises an `IndexError`

# puts a.fetch(7, 'beats me')
beats me

# puts a.fetch(7) { |index| index**2 }
49
```

The method `#fetch` can be found in the documentation for the `Array` class. We know this as `#fetch` is being called on `a`, which is an `Array` created using the percent string `%w`. `%w` creates an `Array` of strings.

`#fetch` has the following signatures:
- `fetch(index) → obj`
- `fetch(index, default) → obj`
- `fetch(index) { |index| block } → obj`

The signatures show that `#fetch` takes an argument `index` and returns an object. `index` is the index of the element of the `Array` we want `#fetch` to return. `#fetch` differs from `#[]` as it also does bounds checking; it checks if the specified element exists before fetching it, and raises an error if it does not.

Having multiple signatures is another way the documentation can indicate an argument is optional. In this case, both `default` and the block are optional arguments but they can't be used together.

In the case of the first signature, `#fetch`is defined as only accepting one argument. It will raise an `IndexError` if the index lies outside the array bounds. Therefore, `a.fetch(7)` raises an error since there is no element at index `7`.

We can supply a `default` value as a second argument which will be returned if `index` is invalid. There is no element at index `7` in `a`, so it returns the `default` value of `"beats me"`.

Lastly, we can also supply a block to `#fetch` which will only be executed when an invalid `index` is referenced. Since there is no element at index `7`, `7` will be passed to the block as an argument. Therefore, `a.fetch(7) { |index| index**2 }` will return `49`.