require 'oystercard'

describe Oystercard do

  context 'balance on card' do

    it 'has money on the card, its initial value is 0' do
      expect(subject.balance).to eq 0
    end

    it 'responds to the balance method' do
      expect(subject).to respond_to(:balance)
    end
  end

  context '#top_up' do

    it 'can do topping up' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'the top up increases the amount on the card' do
      amount = 10
      expect(subject.top_up(amount)).to eq(subject.balance)
    end

    context 'maximum balance' do

      it 'raise error if we try to top of after the card reached the maximum' do
        subject.top_up(90)
        expect{subject.top_up(1)}.to raise_error('The card has reached its maximum, no more top up')
      end

    end
  end



end
