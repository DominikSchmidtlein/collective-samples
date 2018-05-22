class CreateJoinTablePartnershipSample < ActiveRecord::Migration[5.1]
  def change
    create_join_table :partnerships, :samples do |t|
      # t.index [:partnership_id, :sample_id]
      # t.index [:sample_id, :partnership_id]
    end
  end
end
