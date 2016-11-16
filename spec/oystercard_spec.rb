require 'oystercard'

describe OysterCard do
  subject(:oystercard) {described_class.new}

  describe "#top_up" do
    it "should increase the balance by top_up value" do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

    it "should raise an error if max. limit is exceeeded" do
      message = "Cannot top up: £#{OysterCard::MAXIMUM_LIMIT} limit would be exceeded"
      expect {oystercard.top_up(100)}.to raise_error(message)
    end
  end

  context "journey" do

    describe "#touch_in" do
    it "changes in_use to true when touched in" do
      oystercard.top_up(1)
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end

    it "refuses to let you touch in unless the balance is at least £#{OysterCard::MINIMUM_LIMIT}" do
      message = "Error: Insufficient balance, please top up."
      expect {oystercard.touch_in}.to raise_error(message)
    end

  end

    describe "#touch_out" do
      it "changes in_use to false when touched out" do
        oystercard.top_up(1)
        oystercard.touch_in
        oystercard.touch_out
        expect(oystercard.in_journey?).to eq false
      end

      it "deducts a fare on completion of a journey" do
        oystercard.top_up(10)
        oystercard.touch_in
        expect {oystercard.touch_out}.to change{oystercard.balance}.by(-OysterCard::MINIMUM_FARE)
      end
    end
  end

end
