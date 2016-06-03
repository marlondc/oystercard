require "Oystercard"

describe Oystercard do

  context "when new card" do
    it "starts with balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end

  it "responds to top_up with argument" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  describe "#touch_in" do
    let(:station){ double :station}
    let(:other_station){ double :other_staiton }

    context "when card has insufficient balance" do
      it "raises error if card balance below minimum fare value" do
        expect{ subject.touch_in(station) }.to raise_error "Error: minimum balance less than minimum fare. Top-up!"
      end
    end

    it "deducts PENALTY_FARE when touching in without touching out" do
      subject.top_up(10)
      subject.touch_in(:station)
      expect{subject.touch_in(:other_station)}.to change{subject.balance}.by(-6)
    end
  end

  describe "#touch_out" do

    let(:entry_station){ double :station }
    let(:exit_station){ double :station }

    it "deducts PENALTY_FARE fare from balance on touch out if no touch in" do
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-6)
    end

    it "deducts MIN_FARE from balance if touched in and now touching out" do
      subject.top_up(10)
      subject.touch_in(:station)
      expect{subject.touch_out(:exit_station)}.to change{subject.balance}.by(-1)
    end
  end


    # let(:journey){double :entry_station, :exit_station}

    # it "stores a journey" do
    #   subject.top_up(1)
    #   subject.touch_in(entry_station)
    #   subject.touch_out(exit_station)
    #   expect(subject.journeys).to eq ({entry_station => exit_station})
    # end


  describe "#top_up" do
    it "adds to the balance" do
      expect{subject.top_up(1)}.to change{subject.balance}.by(1)
    end
    it "doesnt allow to exceed max balance" do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{subject.top_up(1)}.to raise_error "Maximum balance of #{max_balance} reached!"
    end
  end
end
