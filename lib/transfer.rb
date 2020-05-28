class Transfer
  # your code here

  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    1.times do
      sender.balance-=amount
      receiver.balance+=amount
      @status = "complete"
    end
    if sender.valid?
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end

end
