# A module contains instance or class methods that can be mixed in with other classes to provide more functionality (polymorphism) beyond inheritance.

module Walkable
end

class MyDog
  include Walkable
end

# Instantiation of an instance from the MyDog class using the class method `::new`
sparky = MyDog.new
