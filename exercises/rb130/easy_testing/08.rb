require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_not_kind_of_numeric
    value = 3.0
    assert_kind_of(Numeric, value)
  end
end
