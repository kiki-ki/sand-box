require 'objspace'

list = (1..5).to_a.freeze

double = []
list.each_with_index do |val, idx|
  double[idx] = list[idx] * 2
end

w = list.map do |val|
  val * 2
end

total = list.reduce(0) {|result, item| result + item}

p double
p w
p total