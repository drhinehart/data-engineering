require 'csv'

class DataImporter
  attr_reader :file, :gross_revenue, :purchases

  def initialize(file)
    @file = file
    @purchases = []
  end

  def import
    csv_options = { 
                    headers: :first_row,
                    header_converters: :symbol,
                    converters: :all,
                    col_sep: "\t" 
                  }
    CSV.foreach(file, csv_options).each do |row|
      purchaser = PurchaserImporter.new(row).import
      merchant = MerchantImporter.new(row).import
      item = ItemImporter.new(row, merchant).import
      purchase = PurchaseImporter.new(row, purchaser, item).import
      purchases << purchase
    end
  end

  def gross_revenue
    gross_revenue ||= purchases.reduce(0) { |c,p| c += (p.quantity * p.item.price )}
  end
end