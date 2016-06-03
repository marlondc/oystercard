require "journey_log"

describe JourneyLog do


    xit "has no entry station set" do
    expect(subject.entry_station).to eq nil
    end

    xit "has no journey history saved" do
    expect(subject.journeys).to be_empty
    end


    xit "forgets entry station" do
      subject.top_up(1)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
     expect(subject.entry_station).to eq nil
    end
end
