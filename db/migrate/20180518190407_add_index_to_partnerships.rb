class AddIndexToPartnerships < ActiveRecord::Migration[5.1]
  def change
    add_index :partnerships, [:vendor_shop_id, :supplier_shop_id], unique: true
  end
end
