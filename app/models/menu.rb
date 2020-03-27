class Menu < ApplicationRecord
  belongs_to :business
  has_many   :categories,     dependent: :destroy
  has_many   :location_menus, dependent: :destroy

  accepts_nested_attributes_for :categories, allow_destroy: true

  before_validation :convert_menu_url
  before_validation { self.display_name = self.display_name.capitalize }

  validates :display_name,  presence: true, uniqueness: { scope: :location_menus }
  validates :internal_name, presence: true, uniqueness: { scope: :business }
  validates :menu_url, presence: true

  def convert_menu_url
    return unless self.display_name
    self.menu_url = self.display_name.downcase.parameterize
  end
end
