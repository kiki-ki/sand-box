class Domino
  attr_accessor :domino
  def initialize(domino:)
    @domino = domino
  end

  class << self
    attr_accessor :momo
  end
end
