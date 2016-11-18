require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

    context "entry and exit stations" do

      it "stores the entry stations of a journey in a hash" do
        expect(journey.start(entry_station)).to eq(entry_station)
      end

      it "stores the exit stations of a journey in a hash" do
        journey.start(entry_station)
        journey.finish(exit_station)
        expect(journey.finish(exit_station)).to eq(exit_station)
      end

    end

  context "journey history" do
    let(:current_journey) { {entry_station: entry_station, exit_station: exit_station} }
    it "checks that the card has an empty list of journeys by default" do
      expect(journey.journey_history).to be_empty
    end

    it "stores the entry and exit station" do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.journey_history).to include current_journey
  end
end
end
