=begin
The output is 34.
Assignment does not mutate the `answer` variable.
It reassigns the variable to reference a different object.
Therefore, `answer` still references 42.
If the return value of `#mess_with_it` was assigned to `answer`
  - The output would be 42.
=end

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

answer = mess_with_it(answer)
p answer - 8
