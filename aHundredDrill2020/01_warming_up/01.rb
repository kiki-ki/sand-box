str = "パタトクカシーー"
s = ""
str.length.times{ |i| s += str[i] if i.even? }
p s