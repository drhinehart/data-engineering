require 'spec_helper'

describe DataImporter do
  describe '#new' do
    it 'requires a parameter' do
      expect { DataImporter.new }.to raise_error
    end
  end

  describe '#import' do
    let(:data_importer) { DataImporter.new(Rails.root.join('spec', 'factories', 'example_input.tab')) }

    it 'creates purchasers' do
      expect { data_importer.import }.to change{ Purchaser.count }.from(0).to(3)
    end

    it 'creates items' do
      expect { data_importer.import }.to change{ Item.count }.from(0).to(3)
    end

    it 'creates merchants' do
      expect { data_importer.import }.to change { Merchant.count }.from(0).to(3)
    end

    it 'creates purchases' do
      expect { data_importer.import }.to change { Purchase.count }.from(0).to(4)
    end

    it 'sets the gross revenue' do
      data_importer.import
      data_importer.gross_revenue.should eq(95.0)
    end
  end
end