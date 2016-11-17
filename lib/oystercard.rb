class Oystercard

  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  attr_reader :balance, :entry_station, :journey_history, :exit_station

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def top_up(amount)
    raise 'The card has reached its maximum, no more top up' if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    message = "You cannot touch in without having the minimum fare on your card"
    raise message if @balance < MINIMUM_FARE
  end



  def touch_out(exit_station)
    message = "You can only touch out if you already touched in"
    raise message if !in_journey?
    @exit_station = exit_station
    deduct(MINIMUM_FARE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    return true if @entry_station != nil
    false
  end

end
