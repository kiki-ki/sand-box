def cipher(s)
  tar = ("a".."z")
  s.length.times.map{ |i| tar.include?(s[i]) ? (219 - s[i].ord).chr : s[i] }.join
end
p s = "abcABC"
p encoded = cipher(s)
p decoded = cipher(encoded)
