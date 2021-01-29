# def foo(arr, *arg)
#   p *arr
#   p *arg
# end

# foo([1, 2, 3], {a: "a", b: "b", c: "c"}, "aaa")

def hoge(*args)
  yield(args)
end

hoge(1,2,3) { |args| args.each {|v| p v} }
