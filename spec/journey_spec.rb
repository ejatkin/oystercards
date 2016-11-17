require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  let(:oystercard) {double :oystercard, :balance => 10}

  context 'starting a journey' do
    it 'should store an entry station' do
      journey.start(entry_station)
      expect(journey.trip[:entry_station]).to eq entry_station
    end      
  end

  context 'finishing a journey' do
    it 'should store an exit station' do
      journey.start(entry_station)
      journey.end(exit_station)
      expect(journey.trip[:exit_station]).to eq exit_station
    end
  end

  context 'fare method' do
    it 'should return penalty fare if journey is incomplete' do
      journey.start(entry_station)
      expect(journey.fare).to eq Journey::Penalty_fare
    end

    it 'should return a minimum fare if journey is complete' do
      journey.start(entry_station)
      journey.end(exit_station)
      expect(journey.fare).to eq Journey::Minimum_fare
    end
  end
end
