`Date::civil` can be located on the documentation page for the `Date` class. It is a class method that can be invoked directly on the `Date` class. 

`Date::civil` prints out the given calendar date in the format `#<Date: yyyy-mm-dd ...>`. It accepts 4 arguments defined by the parameters `year`, `month`, `mday`, and `start`. All 4 are optional as they have the default values of `-4712`, `1`, `1`, and `Date::ITALY` respectively.

```ruby
puts Date.civil              #=> return #<Date: -4712-01-01 ...>
puts Date.civil(2016)        #=> return #<Date: 2016-01-01 ...>
puts Date.civil(2016, 5)     #=> return #<Date: 2016-05-01 ...>
puts Date.civil(2016, 5, 13) #=> return #<Date: 2016-05-13 ...>
```

The examples above show that when no arguments for the individual parameters are passed to the method, it will use the default values of each of the parameters.