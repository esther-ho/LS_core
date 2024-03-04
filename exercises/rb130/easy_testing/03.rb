require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_nil
    value = nil
    assert_nil(value)
  end
end
