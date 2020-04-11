def cipher(s)
  range = ("a".."z")
  s.length.times.map{ |i| range.include?(s[i]) ? (219 - s[i].ord).chr : s[i] }.join
end
p s = "abcABC"
p encoded = cipher(s)
p decoded = cipher(encoded)
