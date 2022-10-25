Write out pseudo-code for a method that takes an array of strings, and returns a string that is all those strings concatenated together.

```
Given a collection of strings,

Iterate through the collection one by one.
- Set as an empty string as the starting value
- For each iteration,
  - Append the current value to the saved value.
  - Reassign the modified saved value as the saved value.

After iterating through the collection, return the saved value.
```

Formal pseudo-code:
```
START

# Given a collection of strings called "strings"

SET iterator = 1
SET saved_string = ''

WHILE iterator <= length of strings
  SET saved_string = saved_string + value within strings collection at space "iterator"

  iterator = iterator + 1

PRINT saved_string

END
```