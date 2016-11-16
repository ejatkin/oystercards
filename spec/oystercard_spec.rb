require 'oystercard'

describe OysterCard do
  subject(:oystercard) {described_class.new}

  context "balance" do
    it { is_expected.to respond_to(:balance) }
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it "should increase the balance by top_up value" do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

    it "should raise an error if max. limit is exceeeded" do
      message = "Cannot top up: £#{OysterCard::MAXIMUM_LIMIT} limit would be exceeded"
      expect {oystercard.top_up(100)}.to raise_error(message)
    end
  end

  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "should allow to have value deducted" do
      oystercard.top_up(10)
      oystercard.deduct(2)
      expect(oystercard.balance).to eq 8
    end
  end

  context "journey" do
    it { is_expected.to respond_to(:touch_in) }
    it { is_expected.to respond_to(:touch_out) }
    it { is_expected.to respond_to(:in_journey?)}
    it "changes in_use to true when touched in" do
      oystercard.top_up(1)
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end

    it "changes in_use to false when touched out" do
      oystercard.top_up(1)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq false
    end

    it "refuses to let you touch in unless the balance is at least £#{OysterCard::MINIMUM_LIMIT}" do
      message = "Error: Insufficient balance, please top up."
      expect {oystercard.touch_in}.to raise_error(message)
    end
  end

end
