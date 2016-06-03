require_relative 'journey_log'

class Journey
  attr_reader :entry_station, :exit_station, :journey

  PENALTY_FARE = 6
  MIN_FARE = 1

  def initialize
    @journey = JourneyLog.new
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    @journey.log(@entry_station, @exit_station)
  end

  def fare
    return ((entry_station.zone - exit_station.zone).abs + 1 ) if complete?
    PENALTY_FARE
  end

  def in_journey?
    @entry_station && !@exit_station
  end

  private

  def complete?
    !!@entry_station && !!@exit_station
  end

end
