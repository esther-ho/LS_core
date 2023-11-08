class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

# `FlightlessBird#initialize` is not necessary at the moment as it inherits the `#initialize` method from the `Animal` parent class
# However, it might be added later on if additional attributes are defined specifically for  `FlightlessBird` objects, similar to `SongBird` objects.

class FlightlessBird < Bird
  # def initialize(diet, superpower)
  #   super
  # end

  def move
    puts "I'm running!"
  end
end

# All arguments are passed to `super` keyword if no arguments are specified

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')
