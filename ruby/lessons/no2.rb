a,b = gets.chomp.split(" ").map(&:to_i)
p (a * b).odd? ? "Odd" : "Even"