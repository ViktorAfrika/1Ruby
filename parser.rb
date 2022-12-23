require 'open-uri'
require 'nokogiri'

require_relative 'item.rb'

class Parser
  def self.parse_item(sublink)

    link = "https://www.moyo.ua/ua/#{sublink}.html"
    doc = Nokogiri::HTML(
      URI.open(link)
    )

    Item.new(
      link,
      doc.css('h1.product_name').text.gsub("\n", '').strip,
      doc.css(".product_price meta[itemprop='price']").attribute('content').value,
      doc.css('.product_availability_status.instock-status').text.gsub("\n", '').strip,
      doc.css('.product_id span').text.gsub("\n", '').strip,
      doc.css('.product_image-gallery_item img').map { |element| element.attribute('src').value }
    )
  end
end
