class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new
Cat.generic_greeting
kitty.class.generic_greeting # The return value of invoking `#class` on the instance referenced by `kitty` is the `Class` object `Cat`. Therefore, the class method `::generic_greeting` can be invoked on the return value of `kitty.class`.
