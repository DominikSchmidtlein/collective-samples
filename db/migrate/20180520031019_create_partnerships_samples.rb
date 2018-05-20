class CreatePartnershipsSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :partnerships_samples, id: false do |t|
      t.belongs_to :partnership, index: true
      t.belongs_to :sample, index: true
    end
  end
end
