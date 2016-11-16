class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise 'The card has reached its maximum, no more top up' if balance + amount > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
