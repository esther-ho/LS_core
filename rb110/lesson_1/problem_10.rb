def add_age_group(people)
  people.each do |name, groups|
    case groups["age"]
    when 0..17
      groups["age_group"] = "kid"
    when 18..64
      groups["age_group"] = "adult"
    else
      groups["age_group"] = "senior"
    end
  end
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

add_age_group(munsters)
