class Statement

  def format(transactions)
    balance = 0

    output = transactions.map do |transaction|
      if transaction.type == 'credit'
        "#{date(transaction)} || #{amount(transaction)} || || #{'%.2f' % balance += transaction.amount}"
      else
        "#{date(transaction)} || || #{amount(transaction)} || #{'%.2f' % balance -= transaction.amount}"
      end
    end

    output.reverse
  end

  def header
    'date || credit || debit || balance'
  end

  private

  def date(transaction)
    transaction.time.strftime('%d/%m/%Y')
  end

  def amount(transaction)
    '%.2f' % transaction.amount
  end

end
