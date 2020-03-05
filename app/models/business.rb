class Business < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :menus
  
  validates :name,         presence: true
  validates :email,        presence: true 
  validates :phone_number, presence: true 
end
