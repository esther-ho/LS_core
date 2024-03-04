require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_value_downcase
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end
