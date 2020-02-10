class Menu < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_and_belongs_to_many :locations
  
  validates :name, presence: true
end
