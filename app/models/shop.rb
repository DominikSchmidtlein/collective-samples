class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :sample_orders, dependent: :destroy
  has_many :supplier_partnerships, class_name: 'Partnership', foreign_key: 'vendor_id', dependent: :destroy
  has_many :vendor_partnerships, class_name: 'Partnership', foreign_key: 'supplier_id', dependent: :destroy
end
