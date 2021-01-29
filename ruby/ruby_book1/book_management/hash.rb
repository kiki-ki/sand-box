hash = Hash.new{|h,k| h[k] = {}}
hash[1] = "1"
hash[1][1] = "1-1"
hash[1][2] = "1-2"
p hash[1][1]
hash.each do |key, value|
  puts value
  hash[key].each do |key2, value2|
    puts value2
  end
end