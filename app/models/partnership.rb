class Partnership < ApplicationRecord
  belongs_to :vendor, class_name: 'Shop'
  belongs_to :supplier, class_name: 'Shop'
  has_and_belongs_to_many :samples

  validates_uniqueness_of :vendor, scope: :supplier
  validate :check_partnership_with_self

  def check_partnership_with_self
    if supplier.id == vendor.id
      errors.add(:supplier, "supplier and vendor cannot be the same")
    end
  end
end
