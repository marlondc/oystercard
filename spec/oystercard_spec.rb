require 'oystercard'

describe Oystercard do 

  let (:oystercard) { Oystercard.new }

  it "creates new OysterCard" do 
    expect(oystercard).to be_a (Oystercard)
  end

  it "has a balance of zero when first created" do 
    expect(oystercard.balance).to eq(0)
  end	

end