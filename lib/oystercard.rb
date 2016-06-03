require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90


  attr_reader :balance, :current_journey

  def initialize(journey = Journey.new)
    @balance = 0
    @current_journey = journey
    # @entry_station = nil
  end

  def touch_in(station)
    fail "Error: minimum balance less than minimum fare. Top-up!" if @balance < Journey::MIN_FARE
    deduct(@current_journey.fare) if @current_journey.in_journey?
    @current_journey.start(station)


    # @entry_station = station
    # @journeys[@entry_station] = nil
    # @entry_station

  end

  def touch_out(station)
    # deduct(Journey::MIN_FARE)
    @current_journey.finish(station)
    deduct(@current_journey.fare)
    # @journeys << @current_journey
    # @current_journey = Journey.new
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
