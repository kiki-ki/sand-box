paragragh = "domino"

# 特定のオブジェクトにメソッドを追加 (singleton method)
def paragragh.title?
  self.upcase == self
end

p paragragh.title?
p paragragh.methods.grep /^ti/
p paragragh.singleton_methods
