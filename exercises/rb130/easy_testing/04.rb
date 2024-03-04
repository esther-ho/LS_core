require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_empty
    list = []
    assert_empty(list)
  end
end
