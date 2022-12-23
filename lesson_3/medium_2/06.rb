=begin
Original code:

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
=end

# Refactored
def color_valid(color)
  %w(blue green).include?(color)
end

p color_valid("blue")
p color_valid("green")
p color_valid("red")
