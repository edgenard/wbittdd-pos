class PointOfSale

  def initialize(price_map)
    @price_map = price_map
  end

  def price(barcode)
    @price_map[barcode]
  end
end

class Barcode
end
