module Walkable
  def walk
    "#{name} #{gait} forward"
  end

end

# Using inheritance will eliminate duplicate `#to_s` methods but the hierarchy could get too complicated

class Animal
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"
