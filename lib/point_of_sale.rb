class PointOfSale
  def initialize(price_map)
    @price_map = price_map
  end

  def price(barcode)
    raise PriceNotFoundError unless @price_map[barcode]
    @price_map[barcode]
  end

  class PriceNotFoundError < StandardError
  end
end

class Barcode
end

class Price

end