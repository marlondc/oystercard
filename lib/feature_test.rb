require_relative 'oystercard'  # => true

oystercard = Oystercard.new  # => #<Oystercard:0x007ff9a20321d8 @balance=0, @travelling=false>
p oystercard.top_up(10)
p oystercard.touch_in
p oystercard.start