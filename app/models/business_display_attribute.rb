class BusinessDisplayAttribute < ApplicationRecord
  belongs_to :business
  belongs_to :font

  has_one_attached :favicon
  has_one_attached :business_icon

  validates :primary_color,      presence: true
  validates :secondary_color,    presence: true
  validates :background_color,   presence: true
  validates :heading_color,      presence: true
  validates :nav_bar_color,      presence: true
  validates :general_text_color, presence: true 
  
  after_save :purge_business_icon, if: :remove_business_icon
  after_save :purge_favicon,       if: :remove_favicon

  attr_accessor :remove_business_icon, :remove_favicon

  def sized_business_icon(size: 100)
    business_icon.variant(resize: "!#{size}x#{size}").processed if business_icon.attached?
  end

  def sized_favicon(size: 100)
    favicon.variant(resize: "!#{size}x#{size}").processed if favicon.attached?
  end

  def purge_business_icon
    business_icon.purge_later
  end

  def purge_favicon 
    favicon.purge_later
  end
end
