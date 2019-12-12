hello = "おはよう"
range = 1..10
for i in range do
  p "#{hello}"
end
p "a"
range.each do
  p hello
end
10.times do
  p hello
end