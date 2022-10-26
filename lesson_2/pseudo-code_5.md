Write out pseudo-code for a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become elements at the even indexes of the returned array, while the elements of the second array should become elements at the odd indexes. You may assume that both array arguments have the same number of elements.

Casual Pseudo-code:
```
Given two arrays of the same size containing integers,

Create a new empty array.
Iterate one by one until the end of the length of the first array (since both arrays are the same length).
- For each iteration, find the value from both arrays at the position "interator - 1" since the array index starts at 0.
  - Push the value from the first array to the new array.
  - Push the value from the second array to the new array.

After iterating through both arrays, return the new array.
```

Formal pseudo-code:
```
START

# Given two arrays of the same size containing integers called "array_1" and "array_2"

SET iterator = 1
SET new_array = []

WHILE iterator <= length of array_1
  Push value within array_1 collection at space "iterator - 1" into new_array
  Push value within array_2 collection at space "iterator - 1" into new_array

  iterator = iterator + 1

PRINT new_array

END
```