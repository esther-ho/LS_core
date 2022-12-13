=begin
The data in the hash was edited.
`Hash#values` returns an array of the values of key-value pairs.
Each element in the array is a separate hash.
The value of each key in the hash is reassigned using `Hash#[]=`.
`Hash#[]=` is an indexed assignment, which is mutating.
Ruby passes copies of the reference information to the method.
Therefore, it mutates the original `munsters` hash.
=end
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)
p munsters
