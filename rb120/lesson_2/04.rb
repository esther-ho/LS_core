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

  def same_name?(other_person)
    name == other_person.name
  end

  private

  def split_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts bob.same_name?(rob)
puts bob.name == rob.name
