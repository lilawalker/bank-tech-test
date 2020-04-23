require './lib/account'

statement = <<-STATEMENT
date || credit || debit || balance
21/04/2020 || || 1000.00 || 0.00
21/04/2020 || 1000.00 || || 1000.00
STATEMENT

describe Account do

  before do
    @time_now = Time.parse('21/04/2020')
    allow(Time).to receive(:now).and_return(@time_now)
  end

  subject(:account) { described_class.new }

  let(:credit_transaction) { double('Transaction', amount: 1000.00, type: 'credit', time: Time.now, balance: 1000.00) }
  let(:debit_transaction) { double('Transaction', amount: 1000.00, type: 'debit', time: Time.now, balance: 0.00) }

  describe '.balance' do
    it 'has an initial balance of 0' do
      expect(account.balance).to eq Account::INITIAL_BALANCE
    end
  end

  describe '#deposit' do
    it 'responds to the method' do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it 'adds the deposited amount to the balance' do
      expect { account.deposit(1000.00) }.to change { account.balance }.by(1000.00)
    end

    it 'adds the details of the deposited amount to the list of transactions' do
      allow(Transaction).to receive(:new).with(1000.00, 'credit', 1000.00).and_return(credit_transaction)
      account.deposit(1000.00)
      expect(account.transactions).to include(credit_transaction)
    end
  end

  describe '#withdraw' do
    it 'responds to the method' do
      expect(account).to respond_to(:withdraw).with(1).argument
    end

    it 'subtracts the amount from the balance' do
      account.deposit(1000.00)
      expect { account.withdraw(1000.00) }.to change { account.balance }.by(-1000.00)
    end

    it 'throws an error if there is not enough money in the account' do
      expect { account.withdraw(50) }.to raise_error 'Insufficient balance. Please try again.'
    end

    it 'adds the details of the withdrawn amount to the list of transactions' do
      allow(Transaction).to receive(:new).with(1000.00, 'credit', 1000.00).and_return(credit_transaction)
      account.deposit(1000.00)
      allow(Transaction).to receive(:new).with(1000.00, 'debit', 0.00).and_return(debit_transaction)
      account.withdraw(1000.00)
      expect(account.transactions).to include(debit_transaction)
    end
  end

  describe '#print_statement' do
    it 'displays the formatted statement' do
      allow(Transaction).to receive(:new).with(1000.00, 'credit', 1000.00).and_return(credit_transaction)
      account.deposit(1000.00)
      allow(Transaction).to receive(:new).with(1000.00, 'debit', 0.00).and_return(debit_transaction)
      account.withdraw(1000.00)
      expect { account.display_statement }.to output(statement).to_stdout
    end
  end

end
