class Menu < ApplicationRecord
  belongs_to :business
  
  has_many :categories,     dependent: :destroy
  has_many :location_menus, dependent: :destroy
  
  validates :name, presence: true
end
