score = [100,200,300]
sum = score.reduce(:+)
ave = sum / score.length
p "#{sum}:#{ave}"