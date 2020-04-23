class Statement

  def format(transactions)
    transactions.reverse.map do |transaction|
      row(transaction)
    end
  end

  def header
    'date || credit || debit || balance'
  end

  private

  def row(transaction)
    line = formatted_transaction(transaction)

    if transaction.type == 'credit'
      "#{line[:date]} || #{line[:amount]} || || #{line[:balance]}"
    else
      "#{line[:date]} || || #{line[:amount]} || #{line[:balance]}"
    end
  end

  def formatted_transaction(transaction)
    {
      date: date(transaction.time),
      amount: decimal(transaction.amount),
      balance: decimal(transaction.balance),
    }
  end

  def decimal(value)
    '%.2f' % value
  end

  def date(time)
    time.strftime('%d/%m/%Y')
  end

end
