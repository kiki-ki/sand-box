def to_bigram(s)
  s.length.times.map{ |i| "#{s[i]}#{s[i+1]}" }
end

def se_match?(arr)
  arr.include?("se")
end

x = to_bigram("paraparaparadise")
y = to_bigram("paragraph")

p x & y
p x | y
p x - y

p se_match?(x)
p se_match?(y)
