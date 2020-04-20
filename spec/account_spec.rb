require './lib/account'

describe Account do

  subject(:account) { described_class.new }

  describe '.balance' do
    it 'has an initial balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'responds to the method' do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it 'adds the deposited amount to the balance' do
      expect { account.deposit(1000.00) }.to change { account.balance }.by(1000.00)
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
  end
  
end
