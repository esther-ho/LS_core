class Flight
  # attr_accessor :database_handle
  # This should be removed to prevent easy access to the `@database_handle` instance variable

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
