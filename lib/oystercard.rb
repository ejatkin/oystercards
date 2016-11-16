class OysterCard
  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1
  MINIMUM_FARE = 1
  attr_accessor :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(value)
    raise "Cannot top up: £#{MAXIMUM_LIMIT} limit would be exceeded" if limit_exceeded?(value)
    self.balance += value
  end


  def touch_in(entry_station)
    raise "Error: Insufficient balance, please top up." if insufficient_funds?
    self.entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    self.entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def limit_exceeded?(value)
    self.balance + value > MAXIMUM_LIMIT
  end

  def insufficient_funds?
    self.balance < MINIMUM_LIMIT
  end

  def deduct(value)
    self.balance -= value
  end

  attr_reader :in_use

end
