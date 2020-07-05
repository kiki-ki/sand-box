array = []
n = 0
30.times.each do |i|
  array[i] = 205
end
40.times.each do |i|
  array[i + 30] = 82
end
40.times.each do |i|
  array[i + 70] = 30
end
p array

110.times.each do |j|
  com = array.combination(j + 1).to_a
  n += com.length
end

p n
