class Oystercard

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'The card has reached its maximum, no more top up' if balance + amount > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    message = "You can only touch out if you already touched in" 
    raise message if @in_journey == false
    @in_journey = false
  end
end
