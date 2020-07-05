def randomize(s)
  s.split.map do |w|
    next w if w.length <= 4
    w[0] + w[1..-2].chars.shuffle.join + w[-1]
  end.join(" ")
end

p s = "I couldn’t believe that I could actually understand what I was reading : the phenomenal power of the human mind ."
p randomize(s)
