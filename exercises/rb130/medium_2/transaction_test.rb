require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(10)
  end

  def test_prompt_for_payment
    input = StringIO.new("30\n")
    capture_io { @transaction.prompt_for_payment(input: input) }
    assert_equal 30, @transaction.amount_paid
  end
end
