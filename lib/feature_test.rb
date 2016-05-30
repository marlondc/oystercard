require_relative 'oystercard'  # => true

oystercard = Oystercard.new  # => #<Oystercard:0x007f92bc85b0f0 @balance=0>
oystercard.touch_in
p oystercard.in_journey?
p oystercard.touch_out

