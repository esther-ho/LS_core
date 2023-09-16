class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

# Further exploration
# - It might make sense to define a wheels method if more subclasses that inherit `#wheels` from `Vehicle` has the same number of wheels
# - Alternatively, a constant variable could be initialized for each subclass, and the `#wheels` instance method in `Vehicle` would return the value referenced by the constant variable
