# プログラミングの基礎
# 1. 順次: 上から実行される
# 2. 反復
# 3. 選択

# 2. 反復
total = 0
(1..10).each do |i|
  total += i
end

puts total

total2 = 0
for i in (1..5)
  total2 += i
end
puts total2

# 3. 選択
ayanami_rei = "male"
if ayanami_rei == "female"
  puts "ok"
else
  puts "ayanamirei is not female"
end
