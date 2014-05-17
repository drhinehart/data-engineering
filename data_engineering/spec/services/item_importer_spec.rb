require 'spec_helper'

describe ItemImporter do
  describe '#new' do
    it 'requires a row and merchant parameter' do
      expect { ItemImporter.new }.to raise_error
    end
  end

  describe '#import' do
    let(:merchant) { FactoryGirl.create(:merchant) }
    let(:item_importer) { ItemImporter.new({ item_description: "$10 off $20 of food", item_price: 10.0 }, merchant) }

    it 'returns an item' do
      item_importer.import.should be_kind_of(Item)
    end

    it 'sets the item description' do
      item_importer.import.description.should eq('$10 off $20 of food')
    end

    it 'sets the item price' do
      item_importer.import.price.should eq(10.0)
    end

    it 'sets the merchant' do
      item_importer.import.merchant.should eq(merchant)
    end
  end
end