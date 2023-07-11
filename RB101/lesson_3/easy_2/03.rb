ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10
}

additional_ages = {
  "Marilyn" => 22,
  "Spot" => 237
}

# Add Marilyn and Spot to the existing hash
ages.merge!(additional_ages)
# Alternative: use `#update` which is an alias for `#merge!`
# `#merge` is an alternate non-mutating method
