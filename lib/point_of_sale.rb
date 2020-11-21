class PointOfSale
  BARCODE_TO_PRICE = {
    "12345" => "$123.45",
    "23456" => "$234.56",
    "34567" => "$678.90",
    "" => "Invalid Input no numbers inputted"
  }.freeze
  def barcode_scan(input)
    @input = input.strip
  end

  def price
    BARCODE_TO_PRICE[@input]
  end
end