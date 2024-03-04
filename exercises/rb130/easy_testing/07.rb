require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_instance_of_numeric
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end
end
