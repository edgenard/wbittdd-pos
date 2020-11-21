require 'spec_helper'
require_relative '../lib/point_of_sale'

RSpec.describe PointOfSale do
  describe 'getting the right price' do
    barcode_to_price = {
      "12345" => "$123.45",
      "23456" => "$234.56",
    }
    it 'returns the right price for a barcode' do
      pos = PointOfSale.new
      pos.barcode_scan("12345\n")

      expect(pos.price).to eq(barcode_to_price["12345"])
    end

    it 'returns the right price for 23456' do
      pos = PointOfSale.new
      pos.barcode_scan("23456\n")

      expect(pos.price).to eq(barcode_to_price["23456"])
    end
  end
end