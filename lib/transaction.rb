class Transaction

  attr_reader :amount, :type, :time

  def initialize(amount, type)
    @amount = amount
    @type = type
    @time = Time.now
  end

end
