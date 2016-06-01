
require_relative 'journey'
require_relative 'station'

class Oystercard

	MAXIMUM_BALANCE = 90
	MINIMUM_FARE = 1
	PENALTY_FARE = 6

	attr_reader :balance, :entry_station, :journey_history

	def initialize
		@balance = 0
		@journey = nil
	end

	def top_up(amount)
		fail 'Sorry, you have exceeded the maximum limit' if balance + amount > MAXIMUM_BALANCE
		@balance += amount
	end

	def touch_in(entry_station)
		fail "Please top up" if balance < MINIMUM_FARE 
		deduct(PENALTY_FARE) if @journey
		@journey = Journey.new
		@journey.start(entry_station) 
		self
	end

	def touch_out(exit_station)
	  @journey = Journey.new if !@journey
	  @journey.finish(exit_station)
	  deduct(@journey.fare)
	  @journey = nil
      self
	end

  private

  def deduct(amount)
    @balance -= amount
  end


end




