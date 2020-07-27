class Business < ApplicationRecord
  has_many :users,     dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :menus,     dependent: :destroy
  has_many :tags,      dependent: :destroy
  has_one  :business_display_attribute
  
  accepts_nested_attributes_for :users

  before_validation :sanitize_text
  
  validates :name,         presence: true
  validates :business_url, presence: true, uniqueness: true, format: { with: /\A[a-z\d][a-z\d-]*[a-z\d]\z/i, message: 'only letters, numbers, and dashes.' }
  
  after_create :create_display_attributes

  def create_display_attributes
    self.create_business_display_attribute(
      font_id: Font.default.id,
      heading_font_id: Font.default.id,
      menu_item_header_color: "#000",
      background_color: "#F9FAFB",
      heading_color: "#000",     
      nav_bar_color: "#fff",     
      general_text_color: "#000",
      button_text_color: "#fff",
      button_color: "#F9FAFB",
      card_background_color: "#fff",
      card_border_color: "#000",
      foreground_color: "#F9FAFB",
      foreground_opacity: "0",
      repeat: "true",
      hero_image_or_video: "true"
     )
  end

  private

  def sanitize_text
    self.description = Utility.sanitize_rich_text(description)
  end
end
