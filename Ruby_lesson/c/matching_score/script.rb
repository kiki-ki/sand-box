require 'csv'

def shape(line)
  shaping_line = line.filter { |v| v != nil }
  shaping_line.pop
  shaping_line
end

def write_score(data, num)
  tar = data[num - 1]
  tar_arr = shape(tar)
  output = File.open("./big_five/score.yml", "a")
  tar_arr.each do |item|
    output.puts item
  end
end

data = CSV.read("argorism.csv")
data = data.transpose

# 列番号
row_num = 49
write_score(data, row_num)

# まとめてするとoutputの順番が変わるため使ってない
# for i in row_range
#   write_score(data, i)
# end
