describe 'User Stories' do

let(:account) { Account.new }

  describe 'deposit' do
    # As a user
    # So that I can store my money in a secure place
    # I would like to deposit money into my account

    it 'so money can be deposited into the account' do
      expect { account.deposit(1000.00) }.not_to raise_error
    end
  end

end
