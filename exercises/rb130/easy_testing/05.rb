require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_include?
    list = ['xyz']
    assert_includes(list, 'xyz')
  end
end
