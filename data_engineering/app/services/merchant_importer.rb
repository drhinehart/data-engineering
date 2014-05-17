class MerchantImporter < RowImporter
  def import
    Merchant.where(name: row[:merchant_name], address: row[:merchant_address]).first_or_create
  end
end