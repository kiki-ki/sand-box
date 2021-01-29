ans = rand(1..3)
puts "please choose the door."
first_choice = gets.to_i
false_door = ((1..3).select {|item| item != first_choice && item != ans}).join
puts "ok..."
puts "I'm a gentleman. So I'll tell you one false door."
puts "false door number is #{false_door}."
puts "(opened the door no.#{false_door} and goat scream)"
puts "..."
puts ""
