n,t = gets.chomp.split.map(&:to_i)
x = n.times.map{gets.to_i}.reduce(:*)
p "#{x}"
if x > t
  p "short"
elsif t < x
  p "tall"
else
  p "normal"
end