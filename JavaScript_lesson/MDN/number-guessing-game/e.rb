n = 1
sum = 0
(1..500).reverse_each do |i|
  sum += i
   p sum
  if sum > 5000
    sum = 0
    n += 1
  end
end
p n
