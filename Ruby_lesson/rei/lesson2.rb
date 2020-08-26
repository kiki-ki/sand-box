def weekly_apples(apple)
  week = 7
  total = apple * week
  if 50 < total
    puts "He is big apple man"
  else
    puts "He is small big boy"
  end
end

apple = 3
puts weekly_apples(apple)

apple = 10
puts weekly_apples(apple)
