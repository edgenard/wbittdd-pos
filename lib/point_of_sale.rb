class PointOfSale
  BARCODE_TO_PRICE = {
    "12345" => "$123.45",
    "23456" => "$234.56"
  }.freeze
  def barcode_scan(input)
    @input = input.strip
  end

  def price
    BARCODE_TO_PRICE[@input]
  end
end