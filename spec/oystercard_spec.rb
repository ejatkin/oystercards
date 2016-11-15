require 'oystercard'

describe Oystercard do

  it 'has money on the card, its initial value is 0' do
    expect(subject.money).to eq 0
  end

  it 'has a balance on the card' do
    expect(subject).to respond_to(:balance)
  end

end
