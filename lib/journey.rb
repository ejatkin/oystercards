class Journey

attr_reader :journey_history, :current_journey

  def initialize
    @journey_history = []
    @current_journey = {}
  end

  def start(entry_station)
    @current_journey[:entry_station] = entry_station
  end

  def finish(exit_station)
    return @current_journey[:exit_station] = exit_station
    return @journey_history << @current_journey
  end

  def fare(value)
  end

  def complete?

  end

end
