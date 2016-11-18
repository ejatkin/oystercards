class Journey

attr_reader :journey_history, :current_journey

MINIMUM_FARE = 1
PENALTY = 6

  def initialize
    @journey_history = []
    @current_journey = {}
  end

  def start(entry_station)
    current_journey[:entry_station] = entry_station
  end

  def finish(exit_station)
    return current_journey[:exit_station] = exit_station
    return journey_history << current_journey
  end

  def fare
    return MINIMUM_FARE unless complete?
    return PENALTY if complete?
  end

  private
  attr_writer :journey_history, :current_journey

  def complete?
    current_journey[:entry_station].nil? || current_journey[:exit_station].nil?
  end

end
