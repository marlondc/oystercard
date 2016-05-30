class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :travelling

  def initialize
  	@balance = 0
  	@travelling = false
  end

  def top_up(amount)
  	fail "Balance cannot exceed #{MAXIMUM_BALANCE}" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  # def in_journey?
  #   @travelling
  # end

  def touch_in
  	#fail "already in journey" if in_journey?
    fail "Balance less than #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
  	@travelling = true
  end

  def touch_out
  	@travelling = false
  end


end
