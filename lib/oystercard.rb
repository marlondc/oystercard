require_relative 'journey'

class Oystercard

	MAXIMUM_BALANCE = 90
	MINIMUM_FARE = 1
	PENALTY_FARE = 6

	attr_reader :balance, :entry_station, :journey_history

	def initialize
		@balance = 0
		@in_journey = false
    @entry_station = nil
    @journey_history = Array.new
	end

	def top_up(amount)
		fail 'Sorry, you have exceeded the maximum limit' if balance + amount > MAXIMUM_BALANCE
		@balance += amount
	end

	def in_journey?
		@entry_station ? true : false
	end

	def touch_in(entry_station)
		fail "Please top up" if balance < MINIMUM_FARE
    penalty_fare if @in_journey
    @entry_station = entry_station
		@in_journey = true
		self
	end

	def touch_out(exit_station)
		@in_journey ? minimum_fare : penalty_fare
		@in_journey = false
		@journey_history << Hash[@entry_station, exit_station]
    @entry_station = nil
    self
	end

  private

  def deduct(amount)
    @balance -= amount
  end

  def minimum_fare
		deduct(MINIMUM_FARE)
	end

	def penalty_fare
    deduct(PENALTY_FARE)
	end

end