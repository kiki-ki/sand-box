paragragh = "domino"

# 特定のオブジェクトにメソッドを追加 (特異メソッド: singleton method)
def paragragh.title?
  self.upcase == self
end

p paragragh.title?
p paragragh.methods.grep /^ti/
p paragragh.singleton_methods
