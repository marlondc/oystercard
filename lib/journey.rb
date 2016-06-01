require_relative 'oystercard'

class Journey

	attr_reader :in_journey, :journey_history

	def initialize(entry_station)
		@in_journey = false
		@journey_history = []
		@entry_station = entry_station
	end

end