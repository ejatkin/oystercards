require_relative 'station'

class Journey
  attr_reader :trip, :balance

  Penalty_fare = 6
  Minimum_fare = 1

  def initialize
    @trip = {}
  end

  def start(station)
    trip[:entry_station] = station
  end

  def end(station)
    trip[:exit_station] = station
  end

  def fare
    return Penalty_fare if incomplete?
    return Minimum_fare + charge_zones
  end

  def incomplete?
    trip[:entry_station].nil? || trip[:exit_station].nil?
  end

  private
    attr_writer :trip

   def charge_zones
     first_zone = trip[:entry_station].zone
     second_zone = trip[:exit_station].zone
     (first_zone - second_zone).abs
  end

end
