def how_many_rabits(n)
  child = 1
  adult = 0
  n.times do
    adult += child
    child = adult - child
  end
  "child rabit have #{child}. adult rabit have #{adult}"
end
p "hom many years?"
n = gets.to_i
p how_many_rabits(n)

