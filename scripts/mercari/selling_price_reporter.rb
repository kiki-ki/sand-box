require 'nokogiri'
require 'net/http'
require 'open-uri'

class SellingPriceReporter
  BASE_URI = 'https://www.mercari.com/jp/search/'.freeze

  attr_accessor :uri

  def initialize(params: { key_word: nil, category_root: nil, brand_name: nil, price_min: nil, price_max: nil, status_trading_sold_out: nil })
    q_str = "?#{params.map { |k, v| "#{k}=#{v}" }.join('&')}"
    @uri = BASE_URI + q_str
  end

  def cal_avelage_selling(page_count: 1)
    total = 0
    page_count.times do |i|

    end
  end

  def analystic_html
    doc = Nokogiri::HTML.parse(fetch_html.body)
    # parent_node = doc.xpath('//div[@class="items_box-price font-5"]')
    # p doc.xpath('//dd[@class="items_box-price"]')
  end

  def fetch_html
    Net::HTTP.get_response(URI(uri))
  end
end
