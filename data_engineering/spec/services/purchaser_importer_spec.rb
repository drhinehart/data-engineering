require 'spec_helper'

describe PurchaserImporter do
  describe '#new' do
    it 'requires a row parameter' do
      expect { PurchaserImporter.new }.to raise_error
    end
  end

  describe '#import' do
    let(:purchaser_importer) { PurchaserImporter.new({ purchaser_name: 'Bob' }) }

    it 'returns a purchaser' do
      purchaser_importer.import.should be_kind_of(Purchaser)
    end

    it 'sets the purchaser name' do
      purchaser_importer.import.name.should eq('Bob')
    end
  end
end