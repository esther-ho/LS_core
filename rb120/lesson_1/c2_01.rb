class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(speed)
    @current_speed += speed
    puts "You speed up by #{speed} mph to #{@current_speed} mph."
  end

  def brake(speed)
    @current_speed -= speed
    puts "You brake and your speed drops by #{speed} mph to #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "You shut off the car."
  end

  def spray_paint(color)
    self.color = color
    puts "You painted your car #{color}!"
  end
end

corolla = MyCar.new(2010, 'red', 'toyota corolla')
corolla.speed_up(20)
corolla.brake(5)
corolla.speed_up(10)
corolla.brake(20)
corolla.shut_off

puts corolla.color
corolla.spray_paint('pink')

puts corolla.year
