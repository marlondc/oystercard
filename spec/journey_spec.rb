require 'oystercard'

describe Journey do 

  subject(:journey) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station)  { double :station }

  it 'is initially not in a journey' do
    expect(journey.in_journey).to eq false
  end

  it 'is initially has no journey history' do
    expect(journey.journey_history).to be_empty
  end

  describe '#start' do
  	it 'saves the entry station when it starts a journey' do
  		journey.start(entry_station)
  		expect(journey.entry_station).to eq entry_station
  	end
  end

  describe '#fare' do
    it 'has a penalty fare by default' do
  		expect(subject.fare).to eq Journey::PENALTY_FARE
  	end
  	it 'returns a penalty fare if no exit station given' do
  		journey.start(entry_station)
  		expect(journey.fare).to eq Journey::PENALTY_FARE
  	end
  	it 'calculates the fare' do
  		journey.start(entry_station)
  		journey.finish(exit_station)
  		expect(journey.fare).to eq Oystercard::MINIMUM_FARE
  	end
  end
end