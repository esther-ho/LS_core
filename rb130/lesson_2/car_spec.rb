require 'minitest/autorun'

require_relative 'car'

describe 'Car#hwheels' do
  it 'has 4 wheels' do
    car = Car.new
    _(car.wheels).must_equal 4
  end
end
