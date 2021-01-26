require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
  end 

  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
   if self.valid? && sender.balance > amount && self.status == "pending"
    self.sender.balance -= amount 
    self.receiver.balance += amount
    self.status = "complete"
    else
      reject
    end
  end 

  def reverse_transfer
    if self.valid? && receiver.balance > amount && self.status == "complete"
    self.sender.balance += amount
    self.receiver.balance -= amount
    self.status = "reversed"
    end

  end

  def reject
    self.status = "rejected"
     "Transaction rejected. Please check your account balance."
  end

end
