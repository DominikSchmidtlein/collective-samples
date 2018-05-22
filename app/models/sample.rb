class Sample < ApplicationRecord
  has_and_belongs_to_many :partnerships
  has_and_belongs_to_many :sample_orders

  validates_uniqueness_of :shopify_product_id
end
