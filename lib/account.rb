require_relative 'transaction'

class Account

  INITIAL_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize
    @balance = INITIAL_BALANCE
    @transactions = Array.new
  end

  def deposit(amount)
    @transactions << Transaction.new(amount, 'credit')
    @balance += amount
  end

  def withdraw(amount)
    fail 'Insufficient balance. Please try again.' unless sufficient_funds?(amount)

    @transactions << Transaction.new(amount, 'debit')
    @balance -= amount
  end

  private

  def sufficient_funds?(amount)
    @balance >= amount
  end

end
