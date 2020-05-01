class BusinessDisplayAttribute < ApplicationRecord
  belongs_to :business
  belongs_to :font

  has_one_attached :favicon
  has_one_attached :business_icon

  validates :primary_color,       presence: true
  validates :secondary_color,     presence: true
  validates :background_color,    presence: true
  validates :heading_colour,      presence: true
  validates :nav_bar_colour,      presence: true
  validates :general_text_colour, presence: true

  def sized_business_icon(size: 100)
    business_icon.variant(resize: "!#{size}x#{size}").processed if business_icon.attached?
  end

  def sized_favicon(size: 100)
    favicon.variant(resize: "!#{size}x#{size}").processed if favicon.attached?
  end
end
 