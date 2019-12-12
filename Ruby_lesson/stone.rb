class StoneGame
  @is_me = false
  def initialize(stone, max)
    @stone = stone
    @max = max
  end

  def your_turn
    @is_me = false
    p "your turn, how many stones do you want?"
    num = gets.to_i
    while @max <= num || num < 0
      p "please input one more"
      num = gets.to_i
    end
    @stone -= num
    check
    remaining_stone
  end

  def my_turn
    @is_me = true
    num = rand(1..max)
    p "I want #{num} stones"
    @stone -= num
    check
    remaining_stone
  end

  private
    def remaining_stone
      p "残り#{@stone}個"
    end

    def check
      if @stone <= 0
        p @is_me ? "I am Loser" : "You are Loser"
      else
        return
      end
    end
end

p "Decide on the number of stones and the maximum number you can get at one time"
p "ex) 30 5"
stone,max = gets.chomp.split.map(&:to_i)
game = StoneGame.new(stone, max)
p "if you wanna play first input 0 otherwise input 1"
p "0 or 1"
is_first = gets.to_i
while (!(is_first == 0 || is_first == 1))
  p "0 or 1"
  is_first = gets.to_i
end

while (i == 0)
  if is_first == 0
    game.your_turn
    game.my_turn
  elsif is_first == 1
    game.my_turn
    game.your_turn
  end
end
