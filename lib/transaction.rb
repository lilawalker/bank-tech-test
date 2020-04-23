class Transaction

  attr_reader :amount, :type, :time, :balance

  def initialize(amount, type, balance)
    @amount = amount
    @type = type
    @time = Time.now
    @balance = balance
  end

end
