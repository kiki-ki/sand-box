class StoneGame
  attr_reader :stone, :max
  @is_me = false
  def initialize(stone:, max:)
    @stone = stone
    @max = max
    @count = 0
  end

  def your_turn
    @is_me = false
    display_turn
    puts "your turn, how many stones do you get?"
    num = gets.to_i
    while @max < num || num <= 0
      puts "please input one more"
      num = gets.to_i
    end
    @stone -= num
    check
    remaining_stone
  end

  def my_turn
    @is_me = true
    display_turn
    num = rand(1..@max)
    puts "Computer gets #{num} stones"
    @stone -= num
    check
    remaining_stone
  end

  private
    def display_turn
      @count += 1
      puts "---turn#{@count}---"
    end

    def remaining_stone
      if @stone == 1
        puts "remaining stones is #{@stone}\n"
      else
        puts "remaining stones are #{@stone}\n"
      end

    end

    def check
      if @stone <= 0
        puts @is_me ? "I am Loser" : "You are Loser"
      else
        return
      end
    end
end

puts "Decide on the number of stones and the maximum number you can get at one time"
print "ex) 30 5: "
stone,max = gets.chomp.split.map(&:to_i)
game = StoneGame.new(stone: stone, max: max)
puts "if you wanna play first input 0 otherwise input 1"
print "0 or 1: "
is_first = gets.to_i
while (!(is_first == 0 || is_first == 1))
  print "0 or 1: "
  is_first = gets.to_i
end

while (game.stone > 0)
  if is_first == 0
    game.your_turn
    game.my_turn
  elsif is_first == 1
    game.my_turn
    game.your_turn
  end
end
