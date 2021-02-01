require "spec_helper"
require_relative "../lib/point_of_sale"

RSpec.describe PointOfSale do
  describe "price" do
    context "when barcode matches with price" do
      it "returns price" do
        barcode = Barcode.new
        price_map = {}
        price_map[barcode] = 123.45
        pos = PointOfSale.new(price_map)

        expect(pos.price(barcode)).to eq 123.45
      end
    end

    context "when barcode does not match a price" do
      it "raises an error" do
        barcode = Barcode.new
        price_map = {}
        pos = PointOfSale.new(price_map)

        expect { pos.price(barcode) }.to raise_error(PointOfSale::PriceNotFoundError)
      end
    end

    context "when the price map has multiple values" do
      it "finds the right price for each barcode" do
        barcode = Barcode.new
        barcode2 = Barcode.new
        price_map = {}
        price_map[barcode] = 123.45
        price_map[barcode2] = 234.56
        pos = PointOfSale.new(price_map)

        expect(pos.price(barcode2)).to eq 234.56
      end
    end
  end
end
