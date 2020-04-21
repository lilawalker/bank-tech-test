class Account

  INITIAL_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize
    @balance = INITIAL_BALANCE
    @transactions = Array.new
  end

  def deposit(amount)
    @balance += amount
    @transactions << { time: Time.now, amount: amount, type: 'credit' }
  end

  def withdraw(amount)
    fail 'Insufficient balance. Please try again.' unless sufficient_funds?(amount)

    @balance -= amount
    @transactions << { time: Time.now, amount: amount, type: 'debit' }
  end

  private

  def sufficient_funds?(amount)
    @balance >= amount
  end

end
