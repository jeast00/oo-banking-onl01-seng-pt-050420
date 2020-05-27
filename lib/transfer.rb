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
    if @status == "pending" && sender.valid?
      sender.balance-=amount
      receiver.balance+=amount
      @status = "complete"
    elsif @status == "pending" && sender.balance < 0
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
