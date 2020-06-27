class Menu < ApplicationRecord
  belongs_to :business
  has_many   :categories,     dependent: :destroy
  has_many   :location_menus, dependent: :destroy
  
  has_one_attached :image

  accepts_nested_attributes_for :categories, allow_destroy: true

  before_validation :convert_menu_url
  before_validation :sanitize_text

  validates :display_name,  presence: true
  validates :internal_name, presence: true, uniqueness: { scope: :business }
  validates :menu_url,      presence: true

  after_save :purge_menu_banner, if: :remove_menu_banner
  
  attr_accessor :remove_menu_banner

  def purge_menu_banner
    image.purge_later
  end

  def convert_menu_url
    return unless self.display_name
    self.menu_url = self.display_name.downcase.parameterize
  end
  
  def sized_image(size: 200)
    image.variant(resize: "#{size}x#{size}").processed if image.attached?
  end

  private

  def sanitize_text
    self.description = Utility.sanitize_rich_text(description)
  end
end
