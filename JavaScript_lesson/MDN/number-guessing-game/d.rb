range = 1..50000
sum = 0
for i in range
  if i % 3 == 0
    sum += i
  elsif i.to_s.include?("3")
    sum += i
  end
end
p sum
