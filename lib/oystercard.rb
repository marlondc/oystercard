class Oystercard

	MAXIMUM_BALANCE = 90
	MINIMUM_FARE = 1

	attr_reader :balance

	def initialize
		@balance = 0
		@in_journey = false
	end

	def top_up(amount)
		fail 'Sorry, you have exceeded the maximum limit' if balance + amount > MAXIMUM_BALANCE
		@balance += amount
	end

	def deduct(amount)
		@balance -= amount
	end

	def in_journey?
		@in_journey
	end

	def touch_in
		fail "Please top up" if balance < MINIMUM_FARE
		@in_journey = true
	end

	def touch_out
		@in_journey = false
	end

end