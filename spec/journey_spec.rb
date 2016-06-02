require 'journey'

describe Journey do

let(:station) {double :entry_station}


  describe '#start' do
    it 'responds to start' do
      expect(subject).to respond_to(:start).with(1).argument
    end

    it 'stores the name of the entry station' do
      expect(subject.start(station)).to eq station
    end
  end

  describe '#finish' do
    it 'responds to finish' do
      expect(subject).to respond_to(:finish).with(1).argument
    end

    it 'stores the name of the entry station' do
      expect(subject.start(station)).to eq station
    end
  end

  describe '#fare' do
    it 'responds to fare' do
      expect(subject).to respond_to(:fare)
    end

    it 'it should charge the minimum fare for a journey' do
      subject.start(station)
      subject.finish(station)
      expect(subject.fare).to eq Journey::MIN_FARE
    end
  end

  describe '#in_journey?' do
    it 'starts as incomplete' do
      expect(subject).not_to be_in_journey
    end

    it 'should be in journey after starting' do
      subject.start(station)
      expect(subject).to be_in_journey
    end

    it 'should not be in a journey once journey after finish' do
      subject.start(station)
      subject.finish(station)
      expect(subject).not_to be_in_journey
    end
  end
end
