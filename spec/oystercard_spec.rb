require 'oystercard'

describe Oystercard do

  let (:oystercard) { Oystercard.new }
  let (:maximum_balance) { Oystercard::MAXIMUM_BALANCE }
  let (:minimum_fare) { Oystercard::MINIMUM_FARE }

  it "creates new OysterCard" do
    expect(oystercard).to be_a (Oystercard)
  end

  it "has a balance of zero when first created" do
    expect(oystercard.balance).to eq(0)
  end

  it "is initially not in a journey" do
    expect(oystercard.travelling).to be(false)
  end

  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "tops up balance on card" do
      expect { oystercard.top_up(10) }.to change{ oystercard.balance }.by(10)
    end

    it "raises error if top up will exceed maximum balance" do
      oystercard.top_up(maximum_balance)
      expect{ oystercard.top_up(1) }.to raise_error("Balance cannot exceed #{maximum_balance}")
    end

  end

  describe "#touch_in" do

    it { is_expected.to respond_to(:touch_in)}

    it "can touch in" do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in
      expect(oystercard.travelling).to be(true)
    end

    it "refuse entry if balance < minimum fare" do
      expect{ oystercard.touch_in }.to raise_error("Balance less than #{minimum_fare}")
    end
  end

  describe "#touch_out" do

    it "can touch out" do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.travelling).to be(false)
    end

    it "deducts minimum fare" do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in
      expect{ oystercard.touch_out }.to change{ oystercard.balance }.by(-minimum_fare) 
    end

  end

end
