require "spec_helper"
require_relative "../lib/point_of_sale"

RSpec.describe PointOfSale do
  describe "price" do
    context "when barcode matches with price" do
      it "returns price" do
        barcode = Barcode.new
        price_map = {}
        price = Price.new
        price_map[barcode] = price
        pos = PointOfSale.new(price_map)

        expect(pos.price(barcode)).to eq price
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
        price = Price.new
        price2 = Price.new
        price_map[barcode] = price
        price_map[barcode2] = price2
        pos = PointOfSale.new(price_map)

        expect(pos.price(barcode2)).to eq price2
      end
    end
  end
end
