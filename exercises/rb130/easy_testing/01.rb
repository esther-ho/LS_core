require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_value_odd
    value = 3
    assert_equal(true, value.odd?, "Value is not odd")
  end
end
