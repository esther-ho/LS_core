# The final value of `a` is 2.
# This is because `a` is an integer and immutable. The element at index 0 of `arr` is reassigned to a new integer object.

# The final value of `b` is [3, 8].
# This is because `b` is an array and is mutable. The element at index 0 of `b` is reassigned to a new integer object, and `b` references the mutated array.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
