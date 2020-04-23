require './lib/statement'

describe Statement do

  before do
    @time_now = Time.parse('21/04/2020')
    allow(Time).to receive(:now).and_return(@time_now)
  end

  subject(:statement) { described_class.new }
  let(:credit_transaction) { double('Transaction', amount: 1000.00, type: 'credit', time: Time.now, balance: 1000.00) }
  let(:debit_transaction) { double('Transaction', amount: 1000.00, type: 'debit', time: Time.now, balance: 0.00) }
  let(:transactions) { [credit_transaction, debit_transaction] }

  describe '#format' do
    it 'displays the formatted transactions' do
      expect(statement.format(transactions)).to eq ["21/04/2020 || || 1000.00 || 0.00", "21/04/2020 || 1000.00 || || 1000.00"]
    end
  end

  describe '#header' do
    it 'displays the header' do
      expect(statement.header).to eq "date || credit || debit || balance"
    end
  end
end
