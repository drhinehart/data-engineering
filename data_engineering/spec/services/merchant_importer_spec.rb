require 'spec_helper'

describe MerchantImporter do
  describe '#new' do
    it 'requires a row parameter' do
      expect { MerchantImporter.new }.to raise_error
    end
  end

  describe '#import' do
    let(:merchant_importer) { MerchantImporter.new({ merchant_address: '987 Fake St', merchant_name: 'Bob\'s Pizza' }) }

    it 'returns a merchant' do
      merchant_importer.import.should be_kind_of(Merchant)
    end

    it 'sets the merchant address' do
      merchant_importer.import.address.should eq('987 Fake St')
    end

    it 'sets the merchant name' do
      merchant_importer.import.name.should eq('Bob\'s Pizza')
    end
  end
end