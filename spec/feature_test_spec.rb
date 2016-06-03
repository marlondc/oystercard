require './lib/oystercard'

  oyster = Oystercard.new
  oyster.top_up(10)
# p oyster.touch_in(:aldgate, 2)
# p oyster.balance
# p  oyster.touch_out(:waterloo, 1)
# p  oyster.balance

hello = Oystercard.new
hello.top_up(10)
# hello.touch_in(:aldgate, 2)
# hello.touch_in(:aldgate, 2)
# p hello.balance

oyster.touch_out(:aldgate, 2)
p oyster.balance
