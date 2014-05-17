class PurchaserImporter < RowImporter
  def import
    Purchaser.where(name: row[:purchaser_name]).first_or_create
  end
end