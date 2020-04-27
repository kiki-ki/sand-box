module C
  def my_method
    "hello"
  end
end

class D
  # extend C と同義
  class << self
    include C
  end
end

p D.my_method
