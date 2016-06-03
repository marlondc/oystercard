require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90


  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize(journey = Journey.new)
    @balance = 0
    @current_journey = journey
    # @entry_station = nil
    @journeys = {}
  end

  def touch_in(station)
    fail "Error: minimum balance less than minimum fare. Top-up!" if @balance < Journey::MIN_FARE
    @current_journey.start(station)


    # @entry_station = station
    # @journeys[@entry_station] = nil
    # @entry_station

  end

  def touch_out(station)
    # deduct(Journey::MIN_FARE)
    @current_journey.finish(station)
    deduct(@current_journey.fare)
    # @exit_station = station
    # @journeys[@entry_station] = station
    # @entry_station = nil
  end

  def top_up(amount)
    fail "Maximum balance of #{MAX_BALANCE} reached!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
