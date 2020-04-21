class Account

  INITIAL_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = INITIAL_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail 'Insufficient balance. Please try again.' unless sufficient_funds?(amount)

    @balance -= amount
  end

  private

  def sufficient_funds?(amount)
    @balance >= amount
  end

end
