describe 'User Stories' do

  let(:account) { Account.new }

  describe 'balance' do
    # As a user
    # So that I know how much money is in my account
    # I would like to see the balance on my account

    it 'displays the balance' do
      expect { account.balance }.not_to raise_error
    end
  end

  describe 'deposit' do
    # As a user
    # So that I can store my money in a secure place
    # I would like to deposit money into my account

    it 'can deposit money into the account' do
      expect { account.deposit(1000.00) }.not_to raise_error
    end
  end

end
