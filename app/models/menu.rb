class Menu < ApplicationRecord
  belongs_to :business
  has_many   :categories,     dependent: :destroy
  has_many   :location_menus, dependent: :destroy
  
  has_one_attached :menu_banner

  accepts_nested_attributes_for :categories, allow_destroy: true

  before_validation :convert_menu_url
  before_validation :sanitize_text

  validates :display_name,  presence: true
  validates :internal_name, presence: true, uniqueness: { scope: :business }
  validates :menu_url,      presence: true

  def convert_menu_url
    return unless self.display_name
    self.menu_url = self.display_name.downcase.parameterize
  end

  private

  def sanitize_text
    self.description = Utility.sanitize_rich_text(description)
  end
end
