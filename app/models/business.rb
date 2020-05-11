class Business < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :menus
  has_one  :business_display_attribute
  
  before_validation :sanitize_text
  
  validates :name,         presence: true
  validates :business_url, presence: true, uniqueness: true, format: { with: /\A[a-z\d][a-z\d-]*[a-z\d]\z/i, message: 'only letters, numbers, and dashes.' }
  
  after_create :create_display_attributes

  def create_display_attributes
    self.create_business_display_attribute(
      font_id: Font.default.id,
      primary_color: "#000",
      secondary_color: "#fff",
      background_color: "#F9FAFB",
      heading_color: "#000",     
      nav_bar_color: "#fff",     
      general_text_color: "#000" 
     )
  end

  private

  def sanitize_text
    sanitized_description = sanitize(description)
    self.description = sanitized_description.gsub("\n", '') if sanitized_description
	end
end
