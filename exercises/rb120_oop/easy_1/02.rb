class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# name and @name reference the same object on line 21
# The `#to_s` method in `Pet#initialize` is polymorphic - both String and Integer objects have a `#to_s` method.
# name is reassigned to a different integer object on line 25; @name continues to reference `42`; therefore, line 30 prints `43`
# `42` is interpolated into the string when `Pet#to_s` is invoked on lines 27 and 29

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name


