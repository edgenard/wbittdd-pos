require 'spec_helper'
require_relative '../lib/point_of_sale'

RSpec.describe PointOfSale do
  describe 'getting the right price' do
    barcode_to_price = {
      "12345" => "$123.45",
      "12345\n" => "$123.45",
      "12345\r" => "$123.45",
      "23456" => "$234.56",
      "34567\r" => "$678.90",
      "\n" => "Invalid Input no numbers inputted",
      "45678" => "Not Found",
      "123\n" => "Invalid Input must be exactly five digits",
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