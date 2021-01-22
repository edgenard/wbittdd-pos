require "spec_helper"
require_relative "../lib/point_of_sale"

RSpec.describe PointOfSale do
  describe 'price' do
    context 'when barcode matches with price' do
      it 'returns price' do
        barcode = Barcode.new
        price_map = Hash.new
        price_map[barcode] = 123.45
        pos = PointOfSale.new(price_map)

        expect(pos.price(barcode)).to eq 123.45
      end
    end
  end
end
