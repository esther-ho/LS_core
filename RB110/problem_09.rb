# Return a new array of the same structure but elements in subarrays ordered in descending order

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p arr.map { |subarr| subarr.sort.reverse }
