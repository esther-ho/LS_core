Write out pseudo-code for a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:
```ruby
everyOther([1,4,7,2,5]) # => [1,7,5]
```

Casual pseudo-code
```
Given a collection of integers,

Iterate through the collection by two instead of one by one.
- Set the new collection as empty.
- For each iteration,
  - Push the current value within the numbers collection at space "iterator" into the new collection

After iterating through the collection, return the new collection.
```

Formal pseudo-code
```
START

# Given a collection of integers called "numbers"

SET iterator = 1
SET new_collection = []

WHILE iterator <= length of numbers
  push value within numbers collection at space "iterator" into new_collection
  
  iterator = iterator + 2
  
PRINT new_collection

END
```