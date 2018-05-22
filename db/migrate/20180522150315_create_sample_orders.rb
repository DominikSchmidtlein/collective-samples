class CreateSampleOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_orders do |t|
      t.integer :status, null: false
      t.bigint :shopify_order_id, null: false
      t.references :shop, null: false

      t.timestamps
    end
    add_foreign_key :sample_orders, :shops, column: :shop_id, primary_key: :id
    add_index :sample_orders, :status
  end
end
