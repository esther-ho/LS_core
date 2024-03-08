require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
  end

  def test_accept_money
    transaction = Transaction.new(10)
    transaction.amount_paid = 10
    previous_amount = @cash_register.total_money
    @cash_register.accept_money(transaction)
    current_amount = @cash_register.total_money

    assert_equal previous_amount + 10, current_amount
  end

  def test_change
    transaction = Transaction.new(10)
    transaction.amount_paid = 15
    assert_equal 5, @cash_register.change(transaction)
  end

  def test_give_receipt
    transaction = Transaction.new(10)
    assert_output("You've paid $10.\n") { @cash_register.give_receipt(transaction) }
  end
end
