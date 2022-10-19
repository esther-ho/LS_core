```
# 5.step(to: 10, by: 3) { |value| puts value }
5
8
```

`Numeric#step` can be found in the documentation for the `Numeric` class, which is a parent of the `Integer` class.

`#step` has several signatures. In this example, the signature used is:
`step(by: step, to: limit) { |i| block } → self`

The signature shows that `#step` accepts various arguments: the keyword arguments `by:` and `to:`, as well as a block argument. The difference between keyword arguments and positional arguments is that keyword arguments can be written in any order, *both* in the method definition and method call.

Calling `#step` on an `Numeric` object passes the given block with a sequence of numbers, starting from the number `#step` is called on, and incremented by the argument passed to `step`. When the value passed to the block is greater than `limit`, it ends the loop.

In the problem above, a sequence of numbers is passed to the block, starting from `5`. `5` is printed then incremented by `3`, and `8` is passed to the block and printed. `8` is incremented by `3` again, and `11` is passed to the block. Since `11` is greater than `10`, it ends the loop.