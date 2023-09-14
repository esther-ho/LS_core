class MyCar
  attr_accessor :color
  attr_reader :year, :model

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

  def self.gas_mileage(miles, gallon)
    mileage = miles / gallon
    puts "#{mileage} mpg is your gas mileage."
  end

  def to_s
    "You have a #{year} #{color} #{model}."
  end
end

corolla = MyCar.new(2010, 'red', 'Toyota Corolla')
MyCar.gas_mileage(500, 20)

puts corolla
