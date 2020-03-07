class Business < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :menus
  
  before_validation :convert_business_url

  validates :name,         presence: true
  validates :email,        presence: true 
  validates :phone_number, presence: true 
  validates :business_url, presence: true

  def convert_business_url
    self.business_url = self.business_url.downcase.parameterize
  end
end