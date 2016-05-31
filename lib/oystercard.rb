class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :travelling, :entry_station, :journey_history

  def initialize
  	@balance = 0
      @journey_history= Hash.new
  end

  def top_up(amount)
  	fail "Balance cannot exceed #{MAXIMUM_BALANCE}" if will_exceed_maximum?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Balance less than #{MINIMUM_FARE}" if insufficient_funds?
    fail "Already touched in" if in_journey?
    @entry_station = entry_station
  	self
  end

  def touch_out(exit_station)
  	deduct(MINIMUM_FARE)
  	@entry_station = nil
      @journey_history[@entry_station]= exit_station
  end

  def in_journey?
  	!!@entry_station
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def insufficient_funds?
  	@balance < MINIMUM_FARE
  end

  def will_exceed_maximum?(amount)
  	(@balance + amount) > MAXIMUM_BALANCE
  end

end
