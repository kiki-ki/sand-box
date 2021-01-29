class Hoge
  attr_accessor :a, :nob

  def initialize(arg)
    @nob = arg
  end

  def hoge(a)
    @a = a
  end
end

a = Hoge.new("aaa")
p a
a.hoge("aaa")
p a

