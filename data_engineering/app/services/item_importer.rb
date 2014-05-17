class ItemImporter < RowImporter
  attr_reader :merchant

  def initialize(row, merchant)
    @row = row
    @merchant = merchant
  end

  def import
    Item.where(description: row[:item_description], 
      price: row[:item_price], 
      merchant: merchant).first_or_create
  end
end