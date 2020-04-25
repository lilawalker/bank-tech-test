require_relative 'transaction'
require_relative 'statement'

class Account

  INITIAL_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(statement: Statement.new, transaction_class: Transaction)
    @balance = INITIAL_BALANCE
    @transaction_class = transaction_class
    @transactions = []
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    @transactions << @transaction_class.new(amount, 'credit', @balance)
    "#{amount} deposited to account"
  end

  def withdraw(amount)
    fail 'Insufficient balance. Please try again.' unless sufficient_funds?(amount)

    @balance -= amount
    @transactions << @transaction_class.new(amount, 'debit', @balance)
    "#{amount} withdrawn from account"
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
