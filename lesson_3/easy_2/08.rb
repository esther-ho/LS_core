advice = "Few things in life are as important as house training your pet dinosaur."

# Return "Few things in life are as imporant as "
# Leave advice as "house training your pet dinosaur"
advice.slice(0, 39)
advice # Original string

advice.slice!(0, 39)
advice # Mutated string

# Using `String#slice` will return the deleted portion
# However, it will not mutate the original string
