class Sample < ApplicationRecord
  validate_uniqueness_of :shopify_product_id
end
