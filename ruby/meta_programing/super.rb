class HogeHoge
  def hoge(arg=nil)
    p arg
  end
end

class Hoge < HogeHoge
  def hoge(arg)
    super(arg)
  end
end

Hoge.new.hoge 5
