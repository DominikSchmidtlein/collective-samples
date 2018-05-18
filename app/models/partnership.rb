class Partnership < ApplicationRecord
  belongs_to :vendor_shop, class_name: 'Shop'
  belongs_to :supplier_shop, class_name: 'Shop'

  validates_uniqueness_of :vendor_shop, scope: :supplier_shop
  validate :check_partnership_with_self

  def check_partnership_with_self
    if supplier_shop.id == vendor_shop.id
      errors.add(:supplier_shop, "supplier and vendor cannot be the same")
    end
  end
end
