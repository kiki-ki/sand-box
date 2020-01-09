def cal(n1,n2,n3)
  ans1 = ((-1*n2 + Math.sqrt(n2**2-4*n1*n3)) / (2*n1))
  ans2 = ((-1*n2 - Math.sqrt(n2**2-4*n1*n3)) / (2*n1))
  return "x=#{ans1},#{ans2}"
end

p "please input 3 number"
num1,num2,num3 = gets.chomp.split.map(&:to_i)
ans = cal(num1,num2,num3)
p "(#{num1})x^2+(#{num2})x+(#{num3})"
p ans
