class PurchaseImporter < RowImporter
  attr_reader :item, :purchaser

  def initialize(row, purchaser, item)
    @row = row
    @purchaser = purchaser
    @item = item
  end

  def import
    Purchase.create(purchaser: purchaser, item: item, quantity: row[:purchase_count])
  end
end