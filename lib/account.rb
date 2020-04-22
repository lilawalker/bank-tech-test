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

  def display_statement

    @cummulative_balance = 0

    formatted = @transactions.map do |transaction|
      if transaction.type == 'credit'
        "#{transaction.time.strftime('%d/%m/%Y')} || #{sprintf '%.2f', transaction.amount} || || #{sprintf '%.2f', @cummulative_balance += transaction.amount}"
      else
        "#{transaction.time.strftime('%d/%m/%Y')} || || #{sprintf '%.2f', transaction.amount} || #{sprintf '%.2f', @cummulative_balance -= transaction.amount}"
      end
    end

    statement_header
    puts formatted.reverse
  end

  private

  def statement_header
    puts 'date || credit || debit || balance'
  end

  def sufficient_funds?(amount)
    @balance >= amount
  end

end
