(1..20).each do |n|
  str =
    if n % 3 == 0 && n % 5 == 0
      'fizzbuzz'
    elsif n % 3 == 0
      'fizz'
    elsif n % 5 == 0
      'buzz'
    else
      nil
    end
  puts "#{n}: #{str}" unless str == nil
  break if str == 'fizzbuzz'
end
