class PointOfSale
  BARCODE_TO_PRICE = {
    "12345" => "$123.45",
    "23456" => "$234.56",
    "34567" => "$678.90",
    "" => "Invalid Input no numbers inputted",
    "Not Found" => "Not Found"
  }.freeze
  def barcode_scan(input)
    @input = sanitize_input(input)
  end

  def price
    BARCODE_TO_PRICE[@input]
  end

  def sanitize_input(input)
    stripped_input =  input.strip
    return 'Not Found' if BARCODE_TO_PRICE[stripped_input].nil?
    stripped_input
  end
end