nums = [1,0,5]
for i in 4..31
  p nums[i - 1] = nums[i - 4] + nums[i - 3] + nums[i - 2]
end

