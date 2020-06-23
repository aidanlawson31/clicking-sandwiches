class BusinessDisplayAttribute < ApplicationRecord
  belongs_to :business
  belongs_to :font

  has_one_attached :favicon
  has_one_attached :business_icon
  has_one_attached :background_image

  validates :primary_color,         presence: true
  validates :secondary_color,       presence: true
  validates :background_color,      presence: true
  validates :heading_color,         presence: true
  validates :nav_bar_color,         presence: true
  validates :general_text_color,    presence: true 
  validates :button_text_color,     presence: true
  validates :button_color,          presence: true
  validates :card_background_color, presence: true
  validates :card_border_color,     presence: true
  validates :repeat,                presence: true
  validates :foreground_color,      presence: true
  validates :foreground_opacity,    presence: true, inclusion: 0..10

  after_save :purge_business_icon,    if: :remove_business_icon
  after_save :purge_favicon,          if: :remove_favicon
  after_save :purge_background_image, if: :remove_background_image

  attr_accessor :remove_business_icon, :remove_favicon, :remove_background_image

  def sized_business_icon(size: 100)
    business_icon.variant(resize: "!#{size}x#{size}").processed if business_icon.attached?
  end

  def sized_favicon(size: 100)
    favicon.variant(resize: "!#{size}x#{size}").processed if favicon.attached?
  end

  def sized_background_image(size: 100)
    background_image.variant(resize: "!#{size}x#{size}").processed if background_image.attached?
  end

  def purge_business_icon
    business_icon.purge_later
  end

  def purge_favicon 
    favicon.purge_later
  end

  def purge_background_image
    background_image.purge_later
  end
end
