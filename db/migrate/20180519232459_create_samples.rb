class CreateSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :samples do |t|
      t.bigint :shopify_product_id, null: false

      t.timestamps
    end
    add_index :samples, :shopify_product_id, unique: true
  end
end
