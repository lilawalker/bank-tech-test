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

end
