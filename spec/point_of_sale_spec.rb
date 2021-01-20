require "spec_helper"
require_relative "../lib/point_of_sale"

RSpec.describe PointOfSale do
  describe 'price' do
    context 'when barcode matches with price' do
      it 'returns price' do
        pos = PointOfSale.new
        barcode = Barcode.new

        expect(pos.price(barcode)).to eq 123.45
      end
    end
  end
end
