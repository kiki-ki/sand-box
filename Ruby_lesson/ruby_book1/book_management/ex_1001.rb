require 'date'
class BookInfo
  attr_accessor :title, :author, :page, :publish_date
  def initialize(title:, author:, page:, publish_date:)
    @title = title
    @author = author
    @page = page
    @publish_date = publish_date
  end

  def toFormattedString( sep = "\n" )
    "書籍名：#{title}#{sep}著者名：#{author}#{sep}ページ数：#{page}#{sep}出版日：#{publish_date}"
  end
end

def setUpBooks
  attr_reader :book_infos
  def ini
  book_infos = {
    HarukiMurakami: {
      a: BookInfo.new(title: "騎士団長殺し1", author: "村上春樹", page: 1200, publish_date: Date.parse("2017-2-2")),
      b: BookInfo.new(title: "騎士団長殺し2", author: "村上春樹", page: 1200, publish_date: Date.parse("2017-2-2")),
      c: BookInfo.new(title: "騎士団長殺し3", author: "村上春樹", page: 1200, publish_date: Date.parse("2017-2-2")),
      d: BookInfo.new(title: "騎士団長殺し2", author: "村上春樹", page: 1200, publish_date: Date.parse("2017-2-2")),
    },
    RyuMurakami: {
      a: BookInfo.new(title: "騎士団長殺し1", author: "村上春樹", page: 1200, publish_date: Date.parse("2017-2-2"))
    }
  }
end

a = setUp
book_infos.each do |key, value|
  book_infos[key].each do |inkey, invalue|
    puts book_infos[key][key2].toFormattedString
  end
end