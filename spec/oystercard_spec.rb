require 'oystercard'

describe Oystercard do

  let(:station) {double :station}
  let(:other_station) {double :station}


  it 'has a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end
  it 'is initially has no journey history' do
    expect(subject.journey_history).to be_empty
  end

  describe '#top_up' do

    it 'can top-up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if balance exceeds £95' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{subject.top_up(1)}.to raise_error('Sorry, you have exceeded the maximum limit')
    end
  end

  describe '#touch_in' do

    context 'when balance is zero' do
      it 'can\'t touch-in with 0 balance' do
        expect{subject.touch_in(station)}.to raise_error('Please top up')
      end
    end
    context 'when balance is above minimum' do
      before(:each) do
        subject.top_up(5)
      end
      it 'can touch-in' do
        expect(subject.touch_in(station)).to be_in_journey
      end

      it 'knows where it touched-in' do
        subject.touch_in(station)
        expect(subject.entry_station).to eq station
      end
    end

  end

  describe '#touch_out' do

    it 'can touch-out' do
      subject.touch_out(other_station)
      expect(subject).not_to be_in_journey
    end

    it 'deducts on touch-out' do
      expect {subject.touch_out(other_station)}.to change{subject.balance}.by -Oystercard::MINIMUM_FARE
    end
  end


  describe '#journey_history' do
    it 'makes a journey' do
      subject.top_up 2
      subject.touch_in(other_station).touch_out(station)
      #subject.touch_out(station)
      expect(subject.journey_history).to include(other_station => station)
    end
  end
end


