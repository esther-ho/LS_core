=begin
--- P
Input: an integer that represents the total number of switches
Output: an array that contains integers of lights that are on after `n` repetitions

Explicit rules:
- There are `n` number of switches, starting from `1`
- Each switch is connected to one light that is initially off
- On the first pass, all switches are toggled on

Implicit rules:
- On the second pass, only switches that are multiples of 2 are toggled
- On the third pass, only switches that are multiples of 3 are toggled

--- E
lights_on(5) == [1, 4]
lights_on(10) == [1, 4, 9]

--- D
Input: an integer indicating number of switches
In-between: an array of the state of each light (on/off)
Output: an array of integers (the size may be less than the input integer)

n == 3 # => [1]
=> [0, 0, 0] -> [1, 1, 1] -> [1, 0, 1] -> [1, 0, 0]

--- A
- Create an array with `n` lights in the off state
- Toggle the state of the lights for `n` times
  - For each iteration, toggle all multiples of that iteration
    - e.g.
      - on the first iteration, toggle all multiples of 1
      - on the second iteration, toggle all multiples of 2
      - on the third iteration, toggle all multiples of 3
  - Switches are toggled by changing it between the 'off' state (0) and the 'on' state (1)
- Find the lights that are on after all iterations
  - Create a new array that contains only the n-th lights that remain on
=end

# def lights_on(total_switches)
#   lights = [0] * total_switches

#   1.upto(total_switches) do |n|
#     lights.map!.with_index do |light, switch|
#       next light if (switch + 1) % n != 0
#       light == 0 ? 1 : 0   
#     end
#   end

#   lights.filter_map.with_index { |light, i| (i + 1) if light == 1 }
# end

# Alternative

# def lights_on(total_switches)
#   lights = [false] * total_switches
#   1.upto(total_switches) do |n|
#     n.step(by: n, to: total_switches) do |switch|
#       lights[switch - 1] = !lights[switch - 1]
#     end
#   end

#   lights.filter_map.with_index { |light, i| i + 1 if light }
# end

p lights_on(3) == [1]
p lights_on(5) == [1, 4]
p lights_on(10) == [1, 4, 9]
