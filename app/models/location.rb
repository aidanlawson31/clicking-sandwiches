class Location < ApplicationRecord
  belongs_to :business
  has_many :location_menus, dependent: :destroy

  validates :name,    presence: true
  validates :address, presence: true
end
