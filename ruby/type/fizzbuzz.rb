class Fizzbuzz
  def self.do(n)
    if n % 3 == 0 && n % 5 == 0
      'fizzbuzz'
    elsif n % 3 == 0
      'fizz'
    elsif n % 5 == 0
      'buzz'
    else
      ''
    end
  end
end

(1..20).each do |n|
  str = Fizzbuzz.do(n)
  puts "#{n}: #{str}"
end
