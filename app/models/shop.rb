class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :supplier_partnerships, class_name: 'Partnership', foreign_key: 'vendor_shop_id'
  has_many :vendor_partnerships, class_name: 'Partnership', foreign_key: 'supplier_shop_id'
end
