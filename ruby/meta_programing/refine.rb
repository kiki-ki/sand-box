class String
  def hoge
    p "hoge"
  end
end

p "String".methods.grep /^h/

module StringExtentions
  refine String do
    def hogehoge
      "aaa"
    end
  end
end

p "string".methods.grep /^h/

class StringStuff
  using StringExtentions
  attr_accessor :str

  def initialize(str:)
    @str = str
  end

  def pompom
    @str.hogehoge
  end
end

s = StringStuff.new(str: "aaa")
s.pompom
