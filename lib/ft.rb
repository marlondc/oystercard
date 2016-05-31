require './oystercard.rb'
# require '../lib/staion.rb'

# require '../lib/journey.rb'


oc = Oystercard.new
p "New card. show balance: #{oc.balance}"
p "top up #{oc.top_up 10}"
p "in journey #{oc.in_journey?}"
p "touch in"
oc.touch_in # error here
p oc.balance
p "touch out "
oc.touch_out # 
p "in journey #{oc.in_journey?}"
p oc.balance





# p "#{oc}"

