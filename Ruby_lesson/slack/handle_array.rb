arr = (1..5).to_a
arr.each_with_index do |val, i|
  if val != 1
    arr[i] = 0
  end
end
