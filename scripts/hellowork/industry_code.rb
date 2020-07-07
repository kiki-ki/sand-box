require 'nokogiri'
require 'open-uri'
require 'csv'

def read_html(url)
  charset = nil
  html = URI.open(url) do |f|
    charset = f.charset
    f.read
  end

  Nokogiri::HTML.parse(html, nil, charset)
end

def make_rows(page)
  rows = page.search("td")
  rows.each_slice(2).map do |r|
    "#{r[0].text} #{r[1].text.delete("\n")}"
  end
end

def scrape(url)
  big_url = url[0]
  middle_url = url[1]
  small_url = url[2]

  big_page = read_html(big_url)
  middle_page = read_html(middle_url)
  small_page = read_html(small_url)

  big_rows = make_rows(big_page)
  middle_rows = make_rows(middle_page)
  small_rows = make_rows(small_page)

  CSV.open("industry_code_list.csv", "a", :encoding => "UTF-8") do |csv|
    ranges = [
      1..2, 3..4, [5], 6..8, 9..32, 33..36, 37..41,
      42..49, 50..61, 62..67, 68..70, 71..74, 75..77,
      78..80, 81..82, 83..85, 86..87, 88..96, 97..98, [99]
    ]
    csv << %w[大分類 中分類 小分類 産業コード 産業]
    big_rows.each_with_index do |b_r, i|
      b_arr = b_r.split
      csv << [b_r, nil, nil, b_arr[0], b_arr[1]]

      middle_rows.each do |m_r|
        m_arr = m_r.split
        next unless (ranges[i]).include?(m_arr[0].to_i)
        csv << [nil, m_r, nil, m_arr[0], m_arr[1]]

        small_rows.each do |s_r|
          next unless s_r.start_with?(m_arr[0])
          s_arr = s_r.split
          csv << [nil, nil, s_r, s_arr[0], s_arr[1]]
        end
      end
    end
  end
end

url = [
  'https://www.hellowork.mhlw.go.jp/info/industry_list01.html',
  'https://www.hellowork.mhlw.go.jp/info/industry_list02.html',
  'https://www.hellowork.mhlw.go.jp/info/industry_list03.html',
]

scrape(url)
