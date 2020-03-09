class Menu < ApplicationRecord
  belongs_to :business
  has_many   :categories,     dependent: :destroy
  has_many   :location_menus, dependent: :destroy

  accepts_nested_attributes_for :categories, allow_destroy: true

  before_validation :convert_menu_url

  validates :name,     presence: true, uniqueness: { scope: :business }
  validates :menu_url, presence: true

  def convert_menu_url
    self.menu_url = self.name.downcase.parameterize
  end
end
