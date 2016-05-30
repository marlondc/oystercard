class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :travelling

  def initialize
  	@balance = 0
  	@travelling = false
  end

  def top_up(amount)
  	fail "Balance cannot exceed #{MAXIMUM_BALANCE}" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail "Balance less than #{MINIMUM_FARE}" if @balance < MINIMUM_FARE
  	@travelling = true
  end

  def touch_out
  	deduct(MINIMUM_FARE)
  	@travelling = false
  end

  private

  def deduct(fare)
    @balance -= fare
  end


end
