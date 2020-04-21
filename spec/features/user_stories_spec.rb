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

  describe 'withdraw' do
    context 'sufficient balance' do
      it 'can withdraw money from the account' do
        # As a user
        # So that I can take out money for spending
        # I would like to withdraw money from my account

        account.deposit(50)
        expect { account.withdraw(50) }.not_to raise_error
      end
    end

    context 'insufficient balance' do
      it 'throws an eror if there is not enough money in the account' do
        # As a user
        # So that I do not go into overdraft
        # I would like to see a helpful error message if I try to take out more money than what is in my account

        account.deposit(50)
        account.withdraw(50)
        expect { account.withdraw(50) }.to raise_error 'Insufficient balance. Please try again.'
      end
    end
  end

end
