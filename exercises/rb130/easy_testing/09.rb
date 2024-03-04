require 'minitest/autorun'

class List
  def process
    self
  end
end

class TestExercise < Minitest::Test
  def test_same_list
    list = List.new
    assert_same(list, list.process)
  end
end
