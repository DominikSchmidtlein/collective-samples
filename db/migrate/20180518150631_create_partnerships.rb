class CreatePartnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :partnerships do |t|
      t.references :vendor, null: false
      t.references :supplier, null: false
      t.timestamps
    end

    add_foreign_key :partnerships, :shops, column: :vendor_id, primary_key: :id
    add_foreign_key :partnerships, :shops, column: :supplier_id, primary_key: :id
    add_index :partnerships, [:vendor_id, :supplier_id], unique: true
  end
end
