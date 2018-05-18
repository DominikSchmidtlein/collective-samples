class CreatePartnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :partnerships do |t|
      t.references :vendor_shop
      t.references :supplier_shop
      t.timestamps
    end

    add_foreign_key :partnerships, :shops, column: :vendor_shop_id, primary_key: :id
    add_foreign_key :partnerships, :shops, column: :supplier_shop_id, primary_key: :id
  end
end
