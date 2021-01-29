class Lesson
  attr_reader :name, :address, :nomo
  attr_writer :name, :address
  def initialize(name:)
    @name = name
    @address = address
  end
end