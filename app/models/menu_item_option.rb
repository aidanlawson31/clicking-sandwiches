class MenuItemOption < ApplicationRecord
  belongs_to :menu_item

  validates :name,  presence: true
  validates :price, presence: true
end
