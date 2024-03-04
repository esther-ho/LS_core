require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError, "Has no experience"
  end
end

class TestExercise < Minitest::Test
  def test_hire
    employee = Employee.new
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end
