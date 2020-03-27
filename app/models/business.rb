class Business < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :menus
  has_one  :business_display_attribute
  
  validates :name,         presence: true
  validates :business_url, presence: true, uniqueness: true, format: { with: /\A[a-z\d][a-z\d-]*[a-z\d]\z/i, message: 'only letters, numbers, and dashes.' }
  
  after_create :create_display_attributes

  def create_display_attributes
    create_business_display_attribute(
      business_id: self.id,
      font_id: Font.default.id,
      primary_color: "#000",
      secondary_color: "#fff",
      background_color: "#F9FAFB"
     )
  end
end
