require_relative 'transaction'
require_relative 'statement'

class Account

  INITIAL_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(statement = Statement.new)
    @balance = INITIAL_BALANCE
    @transactions = Array.new
    @statement = statement
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

  def display_statement
    puts @statement.header
    puts @statement.format(transactions)
  end

  private

  def sufficient_funds?(amount)
    @balance >= amount
  end

end
