class BusinessDisplayAttribute < ApplicationRecord
  belongs_to :business
  belongs_to :font

  validates :primary_color,    presence: true
  validates :secondary_color,  presence: true
  validates :background_color, presence: true
end
