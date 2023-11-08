class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

# Line 39 outputs `false` as the `#==` method invoked is the method from the `BasicObject` class. It compares the object ids of the calling object and the object passed to `#==`.
# Since `ada.location` and `grace.location` return two different `GeoLocation` objects, the `#==` method call returns `false`.
# To fix this issue, we need to define a `#==` method for `GeoLocation` objects to compare their coordinates. It will override the `BasicObject#==` method.
