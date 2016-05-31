require './oystercard.rb'
# require '../lib/staion.rb'

# require '../lib/journey.rb'


oc = Oystercard.new
p "New card. show balance: #{oc.balance}"
p "top up #{oc.top_up 10}"
p "in journey #{oc.in_journey?}"
p "touch in"
oc.touch_in(:Bank) # error here
p oc.balance
p "touch out "
p oc.touch_out(:Waterloo)  # 
p "in journey #{oc.in_journey?}"
p oc.balance
p oc.journey_history
oc.touch_in(:Waterloo)
p oc.touch_out(:CanningTown) 
p "......"
 oc.journey_history.each {|j| p j}

# p "#{oc}"

