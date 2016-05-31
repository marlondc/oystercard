class Oystercard

	MAXIMUM_BALANCE = 90
	MINIMUM_FARE = 1

	attr_reader :balance, :entry_station

	def initialize
		@balance = 0
		@in_journey = false
    @entry_station = nil
	end

	def top_up(amount)
		fail 'Sorry, you have exceeded the maximum limit' if balance + amount > MAXIMUM_BALANCE
		@balance += amount
	end

	def in_journey?
		@entry_station ? true : false
	end

	def touch_in(station)
		fail "Please top up" if balance < MINIMUM_FARE
    @entry_station = station
		@in_journey = true
    self
	end

	def touch_out
    deduct MINIMUM_FARE
		@in_journey = false
    @entry_station = nil
    self
	end


  private

  def deduct(amount)
    @balance -= amount
  end

end