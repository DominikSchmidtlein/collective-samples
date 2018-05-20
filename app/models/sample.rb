class Sample < ApplicationRecord
  has_and_belongs_to_many :partnerships

  validates_uniqueness_of :shopify_product_id
end
