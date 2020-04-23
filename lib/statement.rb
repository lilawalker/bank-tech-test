class Statement

  def format(transactions)
    transactions.reverse.map do |transaction|
      date = date(transaction.time)
      amount = decimal(transaction.amount)
      balance = decimal(transaction.balance)

      if transaction.type == 'credit'
        "#{date} || #{amount} || || #{balance}"
      else
        "#{date} || || #{amount} || #{balance}"
      end
    end
  end

  def header
    'date || credit || debit || balance'
  end

  private

  def decimal(value)
    '%.2f' % value
  end

  def date(time)
    time.strftime('%d/%m/%Y')
  end

end
