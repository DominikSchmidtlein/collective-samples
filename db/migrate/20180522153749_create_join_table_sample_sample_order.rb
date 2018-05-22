class CreateJoinTableSampleSampleOrder < ActiveRecord::Migration[5.1]
  def change
    create_join_table :samples, :sample_orders do |t|
      # t.index [:sample_id, :sample_order_id]
      # t.index [:sample_order_id, :sample_id]
    end
  end
end
