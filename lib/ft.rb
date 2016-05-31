require './oystercard.rb'
# require '../lib/staion.rb'

# require '../lib/journey.rb'


oc = Oystercard.new
p "New card. show balance: #{oc.balance}"
p "top up #{oc.top_up 10}"
p "deduct #{oc.deduct 5}"
p "in journey #{oc.in_journey?}"
p "touch in"
oc.touch_in # journey = true
p "touch out "
oc.touch_out # 
p "in journey #{oc.in_journey?}"






# p "#{oc}"

