class Partnership < ApplicationRecord
	belongs_to :vendor_shop, class_name: 'Shop'
	belongs_to :supplier_shop, class_name: 'Shop'
end
