# can initialize a Bank Account (FAILED - 1)
# initializes with a name (FAILED - 2)
# always initializes with balance of 1000 (FAILED - 3)
# always initializes with a status of 'open' (FAILED - 4)

# #valid?
#   can check that both accounts are valid (FAILED - 11)
#   calls on the sender and reciever's #valid? methods (FAILED - 12)
# #execute_transaction
#   can execute a successful transaction between two accounts (FAILED - 13)
#   each transfer can only happen once (FAILED - 14)
#   rejects a transfer if the sender doesn't have a valid account (FAILED - 15)
# #reverse_transfer
#   can reverse a transfer between two accounts (FAILED - 16)
#   it can only reverse executed transfers (FAILED - 17)

require 'pry'
class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def valid?
    if @status == 'open' && @balance > 0
      return true
    else
      return false
    end
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def close_account
    self.status = 'closed'
  end

  
end
