require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let (:maximum_balance) { Oystercard::MAXIMUM_BALANCE }
  let (:minimum_fare) { Oystercard::MINIMUM_FARE }
  let (:station) { double :station }

  it "creates new OysterCard" do
    expect(oystercard).to be_a (Oystercard)
  end

  it "has a balance of zero when first created" do
    expect(oystercard.balance).to eq(0)
  end

  it "is initially not in a journey" do
    expect(oystercard.in_journey?).to be(false)
  end

  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "tops up balance on card" do
      expect { oystercard.top_up(10) }.to change{ oystercard.balance }.by(10)
    end

    it "raises error if top up will exceed maximum balance" do
      oystercard.top_up(maximum_balance)
      expect{ oystercard.top_up(minimum_fare) }.to raise_error("Balance cannot exceed #{maximum_balance}")
    end

  end

  describe "#touch_in" do

    it { is_expected.to respond_to(:touch_in)}

    it "can touch in" do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in(station)
    end

    it "refuse entry if balance < minimum fare" do
      expect{ oystercard.touch_in(station) }.to raise_error("Balance less than #{minimum_fare}")
    end

    it "remembers the entry station" do 
    	oystercard.top_up(minimum_fare)
    	oystercard.touch_in(station)
    	expect(oystercard.entry_station).to eq(station)
    end

    it "refuses entry if already in journey" do
    	oystercard.top_up(minimum_fare)
    	oystercard.touch_in(station)
    	expect{ oystercard.touch_in(station) }.to raise_error("Already touched in")
    end

  end

  describe "#touch_out" do

    it "can touch out" do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in(station)
      oystercard.touch_out(station)
      expect(oystercard.in_journey?).to be(false)
    end

    it "deducts minimum fare" do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in(station)
      expect{ oystercard.touch_out(station) }.to change{ oystercard.balance }.by(-minimum_fare) 
    end

  end

  describe "#journey_history" do
    it "starts with an empty journey history" do
      expect(oystercard.journey_history.length).to eq(0)
    end
     it "loads journey history" do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in(station)
      oystercard.touch_out(station)
      expect(oystercard.journey_history.length).to eq(1)
     end
  end
end
