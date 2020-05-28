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
    if @status == "pending"
    1.times do
      sender.balance-=amount
      receiver.balance+=amount
      @status = "complete"
      end
    elsif @status == "pending" && sender.valid?
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end

  def reverse_transfer

  end

end
