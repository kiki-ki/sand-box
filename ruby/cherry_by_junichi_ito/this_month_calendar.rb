require 'date'

today = Date.today
first_day_of_the_week = Date.new(today.year, today.month, 1).wday
last_day = Date.new(today.year, today.month, -1).day

header = today.strftime("%B %Y")
week = %w[Su Mo Tu We Th Fr Sa]

puts header
puts week.join(" ")
disp =  "   " * first_day_of_the_week

(1..last_day).each do |day|
  disp += day.to_s.rjust(2) + " "

  if (first_day_of_the_week + day) % week.size == 0
    puts disp
    disp = ""
  elsif day == last_day
    puts disp
  end
end
