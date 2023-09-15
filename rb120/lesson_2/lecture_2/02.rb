class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

spark = Dog.new
whiskers = Cat.new

puts spark.speak # => print 'bark!'
puts spark.run
puts spark.swim
puts spark.fetch
puts '----------'
puts whiskers.speak # => print 'meow!'
puts whiskers.run
puts whiskers.swim
