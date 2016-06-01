require 'oystercard'

describe Journey do 

  subject(:journey) {described_class.new(:entry_station)}
  let(:entry_station) {double :station}

  it 'is initially not in a journey' do
    expect(journey.in_journey).to eq false
  end

  it 'is initially has no journey history' do
    expect(journey.journey_history).to be_empty
  end
end