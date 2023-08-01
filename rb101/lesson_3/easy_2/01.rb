ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 402,
  "Eddie" => 10
}

# Check if 'Spot' is present
ages.key?('Spot')
=begin
Alternatives
- ages.has_key?('Spot')
- ages.member?('Spot')
- ages.include?('Spot')
=end
