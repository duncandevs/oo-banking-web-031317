# #execute_transaction
#      can execute a successful transaction between two accounts (FAILED - 5)
#      each transfer can only happen once (FAILED - 6)
#      rejects a transfer if the sender doesn't have a valid account (FAILED - 7)
require 'pry'
class Transfer
  # your code here
  attr_accessor :status , :sender, :receiver , :amount
  attr_reader

  def initialize(sender, receiver, amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
     if self.valid? && self.sender.balance > self.amount && self.status == "pending"
        self.sender.deposit(self.amount * -1)
        self.receiver.deposit(self.amount)
        self.status = 'complete'
      else #rejects the transfer
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if self.status == 'complete'
        self.sender.deposit(self.amount)
        self.receiver.deposit(self.amount * -1)
        self.status = 'reversed'
    end
  end

end #end Class
