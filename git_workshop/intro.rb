# ARGV[0] : filepath
# ARGV[1] : kind (account | friends)

if ARGV.size < 2
  puts "Error: argument num is not enough"
  exit
end

path = ARGV[0]
kind = ARGV[1]

intros = "Hello, I'm Taro.\n"

case kind
when "account"
  FILE.open(path) do |f|
    account_num = f.read
    intros += "my account num is #{account_num}"
  end
  puts intros
when "friends"
  intros += "my friends are\n"
  FILE.open(path) do |f|
    friends = f.read
    intros += frends
  end
  puts intros
else
  puts "Error: invalid kind."
end
