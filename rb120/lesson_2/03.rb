class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    split_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    split_full_name(full_name)
  end

  private

  def split_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

end

bob = Person.new('Robert')
puts bob.name
puts bob.first_name
puts bob.last_name
bob.last_name = 'Smith'
puts bob.name

bob.name = 'John Adams'
puts bob.first_name
puts bob.last_name
