require './lib/account'

describe Account do

  subject(:account) { described_class.new }

  describe '#deposit' do
    it 'responds to the method' do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it 'returns the deposited value' do
      expect(account.deposit(1000.00)).to eq 1000.00
    end
  end

  describe '.balance' do
    it 'has an initial balance of 0' do
      expect(account.balance).to eq 0
    end
  end

end
