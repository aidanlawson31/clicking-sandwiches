class BusinessDisplayAttribute < ApplicationRecord
  belongs_to :business
  belongs_to :font
  belongs_to :heading_font, class_name: "Font", foreign_key: "heading_font_id"

  has_one_attached :favicon
  has_one_attached :background_image
  has_one_attached :banner
  has_one_attached :top_icon
  has_one_attached :hero_image
  has_one_attached :hero_video

  attribute :repeat,                    :boolean, default: false
  attribute :hero_image_or_video,       :boolean, default: true
  attribute :background_image_or_color, :boolean, default: true

  validates :menu_item_header_color, presence: true
  validates :background_color,       presence: true
  validates :heading_color,          presence: true
  validates :nav_bar_color,          presence: true
  validates :general_text_color,     presence: true 
  validates :button_text_color,      presence: true
  validates :button_color,           presence: true
  validates :card_background_color,  presence: true
  validates :card_border_color,      presence: true
  validates :foreground_color,       presence: true
  validates :card_border_radius,     presence: true, inclusion: 1..30
  validates :foreground_opacity,     presence: true, inclusion: 0..10
  validates :hero_image_or_video,                    inclusion: { in: [true, false] }
  validates :background_image_or_color,              inclusion: { in: [true, false] }

  after_save :purge_favicon,          if: :remove_favicon
  after_save :purge_background_image, if: :remove_background_image
  after_save :purge_top_icon,         if: :remove_top_icon
  after_save :purge_banner,           if: :remove_banner
  after_save :purge_hero_image,       if: :remove_hero_image
  after_save :purge_hero_video,       if: :remove_hero_video
  after_save :purge_background_image, unless: :background_image_or_color

  attr_accessor :remove_top_icon, :remove_favicon, :remove_background_image, :remove_banner, :remove_hero_image, :remove_hero_video

  def foreground_rgba(hex, opacity)
    r = hex[1..2].hex
    g = hex[3..4].hex
    b = hex[5..6].hex

    "rgb(#{r},#{g},#{b},#{opacity.to_f/10})"
  end

  def sized_top_icon(size: 100)
    top_icon.variant(resize: "!#{size}x#{size}").processed if top_icon.attached?
  end

  def sized_favicon(size: 100)
    favicon.variant(resize: "!#{size}x#{size}").processed if favicon.attached?
  end

  def sized_background_image(size: 100)
    background_image.variant(resize: "!#{size}x#{size}").processed if background_image.attached?
  end

  def sized_banner(size: 100)
    banner.variant(resize: "!#{size}x#{size}").processed if banner.attached?
  end

  def sized_hero_image(size: 100) 
    hero_image.variant(resize: "!#{size}%x#{size}").processed if hero_image.attached?
  end

  def purge_top_icon         ; top_icon.purge_later         ; end
  def purge_favicon          ; favicon.purge_later          ; end
  def purge_background_image ; background_image.purge_later ; end
  def purge_banner           ; banner.purge_later           ; end
  def purge_hero_image       ; hero_image.purge_later       ; end
  def purge_hero_video       ; hero_video.purge_later       ; end
end
