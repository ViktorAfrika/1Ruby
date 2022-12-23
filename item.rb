class Item
  attr_accessor :link, :title, :price, :availability, :product_code, :images

  def initialize(
    link = nil,
    title = nil,
    price = nil,
    availability = nil,
    product_code = nil,
    images = nil
  )
    @link = link
    @title = title
    @price = price
    @availability = availability
    @product_code = product_code
    @images = images
  end

  def to_s
    "Item
  Link: #{@link}
  Title: #{@title}
  Price: #{@price}
  Availability: #{@availability}
  Code: #{@product_code}
  Images:
    #{@images.join("
    ")}
"
  end

  def to_h
    {
      'link' => @link,
      'title' => @title,
      'price' => @price,
      'availibility' => @availability,
      'product_code' => @product_code,
      'images' => @images
    }
  end

  def info
    yield
  end

  def to_csv
    [
      @link,
      @title,
      @price,
      @availability,
      @product_code,
      @images
    ]
  end

  def as_json(*_options)
    to_h
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def to_txt
    to_s
  end
end
