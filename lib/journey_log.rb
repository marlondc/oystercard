class JourneyLog

  attr_reader :journeys

  def initialize
    @journeys = []
  end


  def log(entry_station, exit_station)
    @journeys.push({entry_station => exit_station})
  end
end
