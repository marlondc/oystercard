

class Journey

	attr_reader :in_journey, :journey_history, :entry_station, :fare, :exit_station

	PENALTY_FARE = 6 

	def initialize
		@in_journey = false
		@journey_history = []
		@fare = PENALTY_FARE
	end

    def start(entry_station)
    	@in_journey = true
    	@entry_station = entry_station
    end

    def finish(exit_station)
    	@in_journey = false
    	@exit_station = exit_station
    	@journey_history << Hash[ @entry_station, @exit_station ]
    	@fare = Oystercard::MINIMUM_FARE if @entry_station
    end
end

