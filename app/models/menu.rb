class Menu < ApplicationRecord
  belongs_to :business
  
  has_many :categories,     dependent: :destroy
  has_many :location_menus, dependent: :destroy

  accepts_nested_attributes_for :categories, allow_destroy: true

  validates :name, presence: true
end
