n = gets.to_i

arr = [0, 1]
(1..n).each do |i|
  arr[i + 1] = arr[i] + arr[i - 1]
end
p arr, arr[n]
