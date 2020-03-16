class Business < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :menus
  has_one  :business_display_attribute
  
  before_validation :convert_business_url

  validates :name,         presence: true
  validates :business_url, presence: true, uniqueness: true
  
  after_create :create_display_attributes

  def convert_business_url
    return unless self.business_url # For tests, preventing "undefined method `downcase' for nil:NilClass" when setting name to nil
    self.business_url = self.business_url.downcase.parameterize
  end

  def create_display_attributes 
    create_business_display_attribute(
      font_id: Font.default.id,
      primary_color: "white",
      secondary_color: "blue",
      background_color: "light-blue"
     )
  end
end
