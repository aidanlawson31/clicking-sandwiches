class Business < ApplicationRecord
  has_many :users
  has_many :locations
  
  validates :name,  presence: true
  validates :email, presence: true 
  validates :phone_number, presence: true 
end
