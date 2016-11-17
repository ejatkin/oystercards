require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:entry_station) {double :entry_station, zone: 1}
  let(:exit_station) {double :exit_station, zone: 1}
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

  context 'testing the first charge for changing zones' do
    let(:station1) {double :station1, :zone => 1 }
    let(:station2) {double :station2, :zone => 2}
    it 'should test the balance deduction due to travel in different zones' do
      journey.start(station1)
      journey.end(station2)
      expect(journey.fare).to eq 2
    end
  end

  context 'testing the second charge for changing zones' do
    let(:station1) {double :station1, :zone => 5 }
    let(:station2) {double :station2, :zone => 1}

    it 'should test the balance deduction due to travel in different zones' do
      journey.start(station1)
      journey.end(station2)
      expect(journey.fare).to eq 5
  end
end
end
