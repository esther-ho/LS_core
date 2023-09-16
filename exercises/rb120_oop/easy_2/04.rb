class Transform
  def initialize(letters)
    @letters = letters
  end

  def uppercase
    letters.upcase
  end

  def self.lowercase(letters)
    letters.downcase
  end

  private

  attr_reader :letters
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
