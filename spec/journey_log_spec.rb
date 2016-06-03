require "journey_log"

describe JourneyLog do


    it "has no entry station set" do
    pending  expect(subject.entry_station).to eq nil
    end

    it "has no journey history saved" do
    pending  expect(subject.journeys).to be_empty
    end


    it "forgets entry station" do
      subject.top_up(1)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
pending
     expect(subject.entry_station).to eq nil
    end
end