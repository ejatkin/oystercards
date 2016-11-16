require 'station'

describe Station do
  subject(:station) { described_class.new("Aldgate",  1) }

  context "Initialize station" do


    it "should store a name" do
      expect(station.name).to eq("Aldgate")
    end

    it "should store a zone" do
      expect(station.zone).to eq(1)
    end
  end

end
