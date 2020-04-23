require './lib/transaction'

describe Transaction do

  before do
    @time_now = Time.parse('21/04/2020')
    allow(Time).to receive(:now).and_return(@time_now)
  end

  subject(:transaction) { described_class.new(1000.00, 'credit', 1000.00) }

  it 'is initialized with the given amount' do
    expect(transaction.amount).to eq 1000.00
  end

  it 'is initialized with the given type' do
    expect(transaction.type).to eq 'credit'
  end

  it 'is initialized with the current time' do
    expect(transaction.time).to eq Time.now
  end

  it 'is initialized with the current balance' do
    expect(transaction.balance).to eq 1000.00
  end

end
