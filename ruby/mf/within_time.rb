def validate(time)
  if time >= 0 && time <= 23
    true
  else
    false
  end
end

def get_anss
  questions = { asked_time: "ある時刻", start_time: "開始時刻", finish_time: "終了時刻" }
  anss = {}
  questions.each do |key, val|
    puts "#{val}を教えてください(0~23)"
    answers[key] = Integer(gets)
  end
  anss
rescue
  puts "不正な値です。0~23の数値を入力してください"
end

anss = get_anss
anss.each do |key, time|
  validate(time)

end
