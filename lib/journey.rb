require_relative 'oyster_card'

class Journey
  attr_reader :trip, :balance

  Penalty_fare = 6
  Minimum_fare = 1

  def initialize
    @trip = {}
  end

  def start(station)
    self.trip[:entry_station] = station
  end

  def end(station)
    self.trip[:exit_station] = station
  end

  def fare
    return Penalty_fare if incomplete?
    return Minimum_fare
  end

  def incomplete?
    self.trip[:entry_station].nil? || self.trip[:exit_station].nil?
  end

  private
    attr_writer :trip

end
