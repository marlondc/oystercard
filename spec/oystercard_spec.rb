require 'oystercard'

describe Oystercard do

  let (:oystercard) { Oystercard.new }

  it "creates new OysterCard" do
    expect(oystercard).to be_a (Oystercard)
  end

  it "has a balance of zero when first created" do
    expect(oystercard.balance).to eq(0)
  end

  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "tops up balance on card" do
      expect { oystercard.top_up(10) }.to change{ oystercard.balance }.by(10)
    end

  end

end
