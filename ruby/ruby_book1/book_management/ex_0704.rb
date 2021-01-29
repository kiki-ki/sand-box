class Class
  attr_reader :name, :age
  @@john = 1
  def initialize(name:, age:)
    @name = name
    @age = age
    @@john += 1
  end

  def display
    p name
    p @@john
  end
end

taro = Class.new(name: "taro", age: "18")
taro.display