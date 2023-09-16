class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end

  private

  attr_reader :name, :age, :color
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.

# Further exploration
# - Omitting the `initialize` method for the `Cat` class definition would be possible if `Pet#initialize` takes a `color` parameter as `Cat` objects will inherit `initialize` from the `Pet` class
# - However, other classes that subclass from `Pet` would also be required to provide a argument for the `color` parameter, which may not be relevant for all subclasses.
