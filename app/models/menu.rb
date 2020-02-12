class Menu < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :location_menus
  
  validates :name, presence: true
end
