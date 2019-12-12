x,n = gets.chomp.split(" ").map(&:to_i)
y,m = gets.chomp.split(" ").map(&:to_i)
p "#{(x*n)+(y*m)}"