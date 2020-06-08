class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize (sender, receiver, amount)
   @sender = sender 
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end
 
 def valid?
   sender.valid? && receiver.valid?
 end
 
  def execute_transaction
   if !valid? || sender.balance < amount
     self.status = "rejected"
      "Transaction rejected. Please check your account balance."
   elsif self.status == "complete"
       "transfer executed"
   else 
     sender.balance -= amount
    receiver.balance += amount
      self.status = "complete"
    end
  end
 
  def  reverse_transfer
    if self.status == "complete"
     sender.balance += amount
     receiver.balance -= amount
     self.status = "reversed"
   
   end
  end   
 end

