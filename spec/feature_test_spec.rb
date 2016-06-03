require 'oystercard'

  oyster = Oystercard.new
  oyster.top_up(10)
  oyster.touch_in(:bank)
  oyster.touch_out(:temple)
  oyster

