require_relative 'oystercard'  # => true

oystercard = Oystercard.new  # => #<Oystercard:0x007ff9a20321d8 @balance=0, @travelling=false>
oystercard.touch_in          # => true
