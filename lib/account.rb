class Account

  attr_reader :balance

  def initialize
    @balance = 0
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
