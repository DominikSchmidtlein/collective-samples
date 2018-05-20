class Sample < ApplicationRecord
  validates_uniqueness_of :shopify_product_id
end
