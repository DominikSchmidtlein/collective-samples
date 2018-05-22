class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :sample_orders
  has_many :supplier_partnerships, class_name: 'Partnership', foreign_key: 'vendor_id'
  has_many :vendor_partnerships, class_name: 'Partnership', foreign_key: 'supplier_id'
end
