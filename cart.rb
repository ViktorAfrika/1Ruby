require 'open-uri'
require 'nokogiri'

require 'csv'
require 'json'

require_relative 'main_application.rb'
require_relative 'item_container.rb'

class Cart

  def initialize
    @items = []
  end

  def get_items
    @items
  end

  def save_to_csv(application)
    CSV.open(
      application.path_to_csv, 'w+',
      headers: %w[link title price availability product_code images],
      write_headers: true
    ) do |csv|
      @items.map { |item| csv << item.to_csv; }
    end
  end

  def save_to_json(application)
    File.open(application.path_to_json, 'w+').write(@items.to_json)
  end

  def save_to_txt(application)
    File.open(application.path_to_txt, 'w+').write(@items.map(&:to_txt).join("\n\r"))
  end
end
