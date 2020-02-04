class Category < ApplicationRecord
  belongs_to :menu
  has_many   :menu_items, dependent: :destroy

  validates :name, presence: true
end
