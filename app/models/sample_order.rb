class SampleOrder < ApplicationRecord
  belongs_to :shop
  has_and_belongs_to_many :samples

  enum status: [:pending, :submitted]
end
