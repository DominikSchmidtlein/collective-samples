class CreateSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :samples do |t|
      t.integer :shopify_product_id

      t.timestamps
    end
    add_index :samples, :shopify_product_id, unique: true
  end
end
