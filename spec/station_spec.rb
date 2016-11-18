require 'station'

describe Station do
  subject(:station) { Station.new("Aldgate", 1) }

  context "station" do

    it "should test the return of the name " do
      expect(station.name).to eq("Aldgate")
    end

    it "should test the return of the zone" do
      expect(station.zone).to eq(1)
    end
  end 
end
