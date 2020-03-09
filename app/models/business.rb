class Business < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :menus
  has_one  :business_display_attribute
  
  before_validation :convert_business_url

  validates :name,         presence: true
  validates :email,        presence: true 
  validates :phone_number, presence: true 
  validates :business_url, presence: true

  after_create :create_display_attributes

  def convert_business_url
    self.business_url = self.business_url.downcase.parameterize
  end

  def create_display_attributes 
    create_business_display_attribute(
      font_id: Font.first.id,
      primary_color: "white",
      secondary_color: "blue",
      background_color: "light-blue"
     )
  end
end
