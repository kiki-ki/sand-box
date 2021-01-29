class Domino
  def my_method
    "domino is here."
  end
  alias_method :pom, :my_method
end

p Domino.new.pom
