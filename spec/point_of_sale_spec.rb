require 'spec_helper'
require_relative '../lib/point_of_sale'

RSpec.describe PointOfSale do
  describe 'getting the right price' do
    it 'returns the right price for a barcode' do
      pos = PointOfSale.new
      pos.barcode_scan("12345/n")

      expect(pos.price).to eq("$123.45")
    end
  end
end