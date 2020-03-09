class BusinessDisplayAttribute < ApplicationRecord
  belongs_to :business
  has_one    :font

  validates :primary_color,    presence: true
  validates :secondary_color,  presence: true
  validates :background_color, presence: true
end
