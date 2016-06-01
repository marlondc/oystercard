require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}
  let(:station) {double :station}
  let(:other_station) {double :station}


  it 'has a balance of zero' do
    expect(oystercard.balance).to eq 0
  end

  describe '#top_up' do

    it 'can top-up the balance' do
      expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end

    it 'raises an error if balance exceeds £95' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      oystercard.top_up(maximum_balance)
      expect{oystercard.top_up(1)}.to raise_error('Sorry, you have exceeded the maximum limit')
    end
  end

  describe '#touch_in' do

    context 'when balance is zero' do
      it 'can\'t touch-in with 0 balance' do
        expect{oystercard.touch_in(station)}.to raise_error('Please top up')
      end
    end
    context 'when balance is above minimum' do
      before(:each) do
        oystercard.top_up(5)
      end
      it 'can touch-in' do
        expect(oystercard.touch_in(station)).to be_in_journey
      end

      it 'knows where it touched-in' do
        oystercard.touch_in(station)
        expect(oystercard.entry_station).to eq station
      end
    end

  end

  describe '#touch_out' do

    it 'can touch-out' do
      oystercard.touch_out(other_station)
      expect(oystercard).not_to be_in_journey
    end

    it 'deducts minimum fare on touch-out, if touched in' do
      oystercard.top_up 2
    	oystercard.touch_in(station)
      expect {oystercard.touch_out(other_station)}.to change{oystercard.balance}.by -Oystercard::MINIMUM_FARE
    end
  end


  describe '#journey_history' do
    it 'makes a journey' do
      oystercard.top_up 2
      oystercard.touch_in(other_station)
      oystercard.touch_out(station)
      expect(oystercard.journey_history).to include(other_station => station)
    end
  end

  describe "#fare" do 

  	it "charges penalty fare if touches out without touching in" do 
  		oystercard.top_up 2 
  		expect{oystercard.touch_out(other_station)}.to change{oystercard.balance}.by -Oystercard::PENALTY_FARE
  	end

  	it "charges penalty fare if touches in without touching out" do
  		oystercard.top_up 10
  		oystercard.touch_in(station)
  		expect{oystercard.touch_in(station)}.to change{oystercard.balance}.by -Oystercard::PENALTY_FARE
  	end
  end
end


