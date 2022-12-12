advice = "Few things in life are as important as house training your pet dinosaur."

# Return "Few things in life are as imporant as "
# Leave advice as "house training your pet dinosaur"
p advice.slice(0, advice.index('house')) # 'house' starts at index 39
p advice # Original string

p advice.slice!(0, advice.index('house'))
p advice # Mutated string

# Using `String#slice` will return the deleted portion
# However, it will not mutate the original string
