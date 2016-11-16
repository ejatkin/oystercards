require_relative 'oyster_card'

class Journey
  attr_reader :trip, :balance

  def initialize
    @fare = 0
    @trip = {}
  end

  def start(station)
    # if incomplete?
    #   self.fare = 6
    # else
    #   self.fare = 1
    self.trip[:entry_station] = station
  end

  def end(station)
    self.trip[:exit_station] = station
  end

  def incomplete?
    self.trip[:entry_station].nil? || self.trip[:exit_station].nil?
  end


  private
    attr_writer :trip

end
