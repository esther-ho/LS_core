module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(miles, gallon)
    mileage = miles / gallon
    puts "#{mileage} mpg is your gas mileage."
  end

  def self.total_vehicles
    @@number_of_vehicles
  end

  def age
    puts "My #{model} is #{calculate_age} years old."
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

  private

  def calculate_age
    Time.now.year - year
  end
end

class MyCar < Vehicle
  NUMBER_OF_WHEELS = 4

  def to_s
    "My car is a #{year} #{color} #{model}."
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_WHEELS = 6

  def to_s
    "My truck is a #{year} #{color} #{model}."
  end
end

corolla = MyCar.new(2010, 'red', 'Toyota Corolla')
tacoma = MyTruck.new(2007, 'silver', 'Toyota Tacoma')

puts corolla
puts tacoma
puts Vehicle.total_vehicles
puts tacoma.can_tow?(100)

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

corolla.speed_up(5)
corolla.brake(5)
corolla.shut_off

tacoma.color = 'rainbow'
puts tacoma
tacoma.age
