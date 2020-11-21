require 'spec_helper'
require_relative '../lib/point_of_sale'

RSpec.describe PointOfSale do
  describe 'getting the right price' do
    barcode_to_price = {
      "12345" => "$123.45",
      "12345\n" => "$123.45",
      "12345\r" => "$123.45",
      "23456" => "$234.56",
    }

    barcode_to_price.each do |scan, output|
      it "output is #{output} when given #{scan}" do
        pos = PointOfSale.new
        pos.barcode_scan(scan)

        expect(pos.price).to eq(output)
      end
    end

  end
end