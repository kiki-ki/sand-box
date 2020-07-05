def to_ngram(v)
  v = v.delete(" ").split("") if v.instance_of?(String)
  v.map.with_index{ |w, i| "#{w}#{v[i + 1]}" }
end

p to_ngram(%W(I am an NLPer))
p to_ngram("I am an NLPer")