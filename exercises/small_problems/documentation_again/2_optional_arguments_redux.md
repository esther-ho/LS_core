`Date::civil` can be located on the documentation page for the `Date` class in the *Standard library* API documentation. It differs from the *Core* API which comes by default. We need to `require` the additional libraries in the *Standard library* in order to use them.

`Date::civil` is a class method that can be invoked directly on the `Date` class. `Date::new` is a similar alternate method. It prints out the given calendar date in the format `#<Date: yyyy-mm-dd ...>`. It has the signature: `civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → Date`

The signature uses `[]` to show that all 4 arguments (defined by `year`, `month`, `mday`, and `start`) are optional as they have the default values of `-4712`, `1`, `1`, and `Date::ITALY` respectively. Using `[]` is a documentation-only convention. Note that the brackets are nested, which indicates that items inside the innermost bracket pairs must be omitted if the outermost bracket pairs are omitted, e.g. if you omit `month`, you must omit `mday` and `start`, but must provide `year`.

```ruby
puts Date.civil              #=> return #<Date: -4712-01-01 ...>
puts Date.civil(2016)        #=> return #<Date: 2016-01-01 ...>
puts Date.civil(2016, 5)     #=> return #<Date: 2016-05-01 ...>
puts Date.civil(2016, 5, 13) #=> return #<Date: 2016-05-13 ...>
```

The examples above show that when no arguments for the individual parameters are passed to the method, it will use the default values of each of the parameters.