require 'spec_helper'

describe PurchaseImporter do
  describe '#new' do
    it 'requires a row, purchaser, and item parameter' do
      expect { PurchaserImporter.new }.to raise_error
    end
  end

  describe '#import' do
    let(:purchaser) { FactoryGirl.create(:purchaser) }
    let(:item) { FactoryGirl.create(:item) }
    let(:purchase_importer) { PurchaseImporter.new({ purchase_count: 10 }, purchaser, item) }

    it 'returns an purchase' do
      purchase_importer.import.should be_kind_of(Purchase)
    end

    it 'sets the purchase quantity' do
      purchase_importer.import.quantity.should eq(10)
    end

    it 'sets the purchase purchaser' do
      purchase_importer.import.purchaser.should eq(purchaser)
    end

    it 'sets the purchase item' do
      purchase_importer.import.item.should eq(item)
    end
  end
end