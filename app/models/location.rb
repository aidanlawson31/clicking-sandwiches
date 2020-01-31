class Location < ApplicationRecord
  belongs_to :business
  has_many   :menus

  validates :name,    presence: true
  validates :address, presence: true
end
