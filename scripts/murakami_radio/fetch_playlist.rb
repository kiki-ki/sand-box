require 'nokogiri'
require 'open-uri'

uri = 'https://www.tfm.co.jp/murakamiradio/'

c = nil

html = URI.open(uri) do |f|
  c = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, c)
doc.xpath('//dd[@class="sng"]').each_with_index do |node, idx|
  puts "#{idx}: #{node.inner_text}"
end
