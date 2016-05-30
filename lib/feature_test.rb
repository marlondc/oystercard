require_relative 'oystercard'  # => true

oystercard = Oystercard.new  # => #<Oystercard:0x007f92bc85b0f0 @balance=0>
oystercard.balance           # => 0
oystercard.top_up(10)        # => 10
oystercard.balance           # => 10
