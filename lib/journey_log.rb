class JourneyLog

  attr_reader :journeys

  def initialize
    @entry_station = nil
    @journeys = []

  end

  def start(station)
    @entry_station = station
  end

  def log(station)
    @journeys << {@entry_station => station}
  end
end