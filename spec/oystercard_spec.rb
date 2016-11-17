require 'oystercard'

describe Oystercard do

  subject(:oyster) {described_class.new}

  let(:entry_station) { double :entry_station}
  let(:exit_station) { double :exit_station}


  context 'balance on card' do

    it 'has money on the card, its initial value is 0' do
      expect(oyster.balance).to eq 0
    end

    it 'responds to the balance method' do
      expect(oyster).to respond_to(:balance)
    end
  end

  context '#top_up' do

    it 'can do topping up' do
      expect(oyster).to respond_to(:top_up).with(1).argument
    end

    it 'the top up increases the amount on the card' do
      amount = 10
      expect(oyster.top_up(amount)).to eq(oyster.balance)
    end

    context 'maximum balance' do

      it 'raise error if we try to top of after the card reached the maximum' do
        oyster.top_up(90)
        expect{oyster.top_up(1)}.to raise_error('The card has reached its maximum, no more top up')
      end

    end
  end

  context 'deduct_money' do

    before(:each) do
      oyster.top_up(70)
    end

    it "should deduct minimum fare from balance at touch out" do
      oyster.touch_in(entry_station)
      expect{oyster.touch_out(exit_station)}.to change{oyster.balance}.by(-Oystercard::MINIMUM_FARE)
    end
  end

  context '#entry_station' do

    it 'records the entry_station on card' do
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      expect(oyster.entry_station).to eq entry_station
    end
  end

  context '#exit station' do
    it 'adds exit_station to card on touching out' do
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(oyster.exit_station).to eq exit_station
    end
  end

  context "raise error" do

    it "when trying to touch out without touching in" do
      message = "You can only touch out if you already touched in"
      expect{oyster.touch_out(exit_station)}.to raise_error message
    end

    it 'raises an error when you try to touch in with less than minimum fare on balance' do
      message = "You cannot touch in without having the minimum fare on your card"
      expect{oyster.touch_in(entry_station)}.to raise_error message
    end

  end

  context "journey history" do

    it "checks that the card has an empty list of journeys by default" do
      expect(oyster.journey_history).to eq []
    end

  end

end
