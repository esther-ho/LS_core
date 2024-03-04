require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_does_not_include
    list = ['xyz']
    refute_includes(list, 'xyz')
  end
end
