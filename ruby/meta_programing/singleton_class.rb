class C
  def method_a
    "aaa"
  end

  def self.domino
    "domino!!"
  end
end

class D < C
end

p D.new.method_a
p D.domino
