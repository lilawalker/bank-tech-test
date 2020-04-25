require './lib/account'

statement = <<-STATEMENT
date || credit || debit || balance
21/04/2020 || || 1000.00 || 0.00
21/04/2020 || 1000.00 || || 1000.00
STATEMENT

describe Account do

  let(:transaction_double) { double :transaction }
  let(:transaction_class_double) { double :transaction_class, new: transaction_double }
  let(:statement_double) { double :statement }
  subject(:account) { described_class.new(transaction_class: transaction_class_double, statement: statement_double) }

  describe '.balance' do
    it 'has an initial balance of 0' do
      expect(account.balance).to eq Account::INITIAL_BALANCE
    end
  end

  describe '.transactions' do
    it 'is initialized with an empty array' do
      expect(account.transactions).to eq Array.new
      expect(account.transactions.length).to eq 0
    end

    it 'adds a transaction to the list of transations' do
      expect { account.deposit(1000) }.to change { account.transactions.length }.by(1)
    end
  end

  describe '#deposit' do
    it 'adds the deposited amount to the balance' do
      expect { account.deposit(1000.00) }.to change { account.balance }.by(1000.00)
    end

    it 'creates a new credit transaction' do
      expect(account.deposit(1000)).to eq "1000 deposited to account"
    end
  end

  describe '#withdraw' do
    it 'subtracts the amount from the balance' do
      account.deposit(1000)
      expect { account.withdraw(1000.00) }.to change { account.balance }.by(-1000.00)
    end

    it 'throws an error if there is not enough money in the account' do
      expect { account.withdraw(50) }.to raise_error 'Insufficient balance. Please try again.'
    end

    it 'creates a new debit transaction' do
      account.deposit(1000)
      expect(account.withdraw(1000)).to eq "1000 withdrawn from account"
    end
  end

  describe '#print_statement' do
    it 'displays the formatted statement' do
      account.deposit(1000.00)
      account.withdraw(1000.00)
      allow(statement_double).to receive(:header).and_return("date || credit || debit || balance")
      allow(statement_double).to receive(:format).with([transaction_double, transaction_double]).and_return([
        "21/04/2020 || || 1000.00 || 0.00",
        "21/04/2020 || 1000.00 || || 1000.00"
      ])
      expect { account.display_statement }.to output(statement).to_stdout
    end
  end

end
