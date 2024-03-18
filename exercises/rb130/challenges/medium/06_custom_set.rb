=begin
--- P
Class needs:
- CustomSet#initialize can take 1 array argument (optional)
- CustomSet#empty? returns true if set is empty
- CustomSet#contains? takes an integer argument and returns true if argument is present in set
- CustomSet#subset? takes a CustomSet object as an argument and returns true if self is part of the argument
- CustomSet#disjoint? takes a CustomSet object and returns true if self and argument do not share elements
- CustomSet#eql? takes a CustomSet object and returns true if both have the same elements (order not important)
- CustomSet#== same as CustomSet#eql?
- CustomSet#add takes an integer argument and adds it to the back of the set IF the element does not exist in the set
- CustomSet#intersection takes a CustomSet object and returns a new CustomSet object of shared elements
- CustomSet#difference takes a CustomSet object and returns a new CustomSet object with elements from argument removed from self
- CustomSet#union takes a CustomSet object and returns a new CustomSet object with elements from both the argument and self
--- E
CustomSet.new.contains?(1) => false
CustomSet.new.subset(CustomSet.new) => true
CustomSet.new.subset(CustomSet.new([1])) => true
CustomSet.new([1]).subset(CustomSet.new) => false
CustomSet.new.disjoint?(CustomSet.new) => true
CustomSet.new([1, 2]).disjoint?(CustomSet.new([2, 3])) => false
CustomSet.new.eql?(CustomSet.new) => true
CustomSet.new([1, 2]).eql?(CustomSet.new([2, 1])) => true
CustomSet.new([1, 2, 2, 1]).eql?(CustomSet.new([2, 1])) => true
CustomSet.new.add(3) == CustomSet.new([3]) => true
CustomSet.new([1, 2, 3]).add(3) == CustomSet.new([1, 2, 3])
CustomSet.new.intersection(CustomSet.new) == CustomSet.new => true
CustomSet.new([1, 2, 3]).intersection(CustomSet.new([2])) == CustomSet.new([2]) => true
CustomSet.new([1, 2, 3]).difference(CustomSet.new([2])) == CustomSet.new([1, 3]) => true
CustomSet.new([1, 2]).union(CustomSet.new([2, 3])) == CustomSet.new([1, 2, 3]) => true
--- D

--- A
- CustomSet#initialize can take 1 array argument (optional)
  - optional argument is an empty array
  - set contains only unique elements
  - sort set for future comparisons
- CustomSet#empty? returns true if set is empty
- CustomSet#contains? takes an integer argument and returns true if argument is present in set
  - check if argument is present in set
- CustomSet#subset? takes a CustomSet object as an argument and returns true if self is part of the argument
  - return true if self is empty
  - else, return true if elements in self are all present in argument
- CustomSet#disjoint? takes a CustomSet object and returns true if self and argument do not share elements
  - return true if self or argument is empty
  - else, return true if none of elements in self are present in argument
- CustomSet#eql? takes a CustomSet object and returns true if both have the same elements (order not important)
  - return true if self and argument have the exact same elements
- CustomSet#== same as CustomSet#eql?
- CustomSet#add takes an integer argument and adds it to the back of the set IF the element does not exist in the set
  - check if argument exists in the set
  - if it does not, add to the set and resort the set
- CustomSet#intersection takes a CustomSet object and returns a new CustomSet object of shared elements
  - filter elements from self that also exist in argument
- CustomSet#difference takes a CustomSet object and returns a new CustomSet object with elements from argument removed from self
  - subtract elements of argument from self
- CustomSet#union takes a CustomSet object and returns a new CustomSet object with elements from both the argument and self
  - add elements from argument to self
=end

class CustomSet
  def initialize(set = [])
    @set = set.uniq.sort
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    set.all? { |num| other.set.include?(num) }
  end

  def disjoint?(other)
    set.none? { |num| other.set.include?(num) }
  end
  
  def eql?(other)
    set == other.set
  end

  alias_method :==, :eql?

  def add(num)
    unless set.include?(num)
      set << num
      set.sort!
    end

    self
  end

  def intersection(other)
    shared = set.select { |num| other.set.include?(num) }
    self.class.new(shared)
  end

  def difference(other)
    self.class.new(set - other.set)
  end
  
  def union(other)
    self.class.new(set + other.set)
  end

  protected

  attr_reader :set
end
