require 'nokogiri'
require 'open-uri'
require 'csv'

def scrape(url, big_row)
  charset = nil
  html = URI.open(url) do |f|
    charset = f.charset
    f.read
  end

  page = Nokogiri::HTML.parse(html, nil, charset)

  middle_rows = page.search("td/a")
  small_rows = page.search('td').children.select { |r| r.to_s.start_with?(/\d/) }

  CSV.open("job_code_list.csv", "a", :encoding => "UTF-8") do |csv|
    csv << %w[大分類 中分類 小分類 細分類 職業コード 職業]
    csv << [big_row]
    middle_rows.each do |m|
      m_arr = m.text.split
      csv << [nil, m, nil, nil, m_arr[0], m_arr[1]]
      small_rows.each do |s|
        s_arr = s.to_s.split
        if s_arr[0].length >= 4
          csv << [nil, nil, nil, s, s_arr[0], s_arr[1]]
        else
          csv << [nil, nil, s, nil, s_arr[0], s_arr[1]]
        end if s_arr[0].start_with?(m_arr[0])
      end
    end
  end
end

url_arr = [
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_01.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_02.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_03.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_04.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_05.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_06.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_07.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_08.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_09.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_10.html',
  'https://www.hellowork.mhlw.go.jp/info/mhlw_job_dictionary_11.html'
]
big_rows = [
  "A 管理的職業",
  "B 専門的・技術的職業",
  "C 事務的職業",
  "D 販売の職業",
  "E サービスの職業",
  "F 保安の職業",
  "G 農林漁業の職業",
  "H 生産工程の職業",
  "I 輸送・機械運転の職業",
  "J 建設・採掘の職業",
  "K 運搬・清掃・包装等の職業"
]

url_arr.each_with_index do |url, i|
  scrape(url, big_rows[i])
end

