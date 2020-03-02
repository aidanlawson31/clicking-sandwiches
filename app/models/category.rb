class Category < ApplicationRecord
  belongs_to :menu
  has_many   :menu_items, dependent: :destroy

  accepts_nested_attributes_for :menu_items, allow_destroy: true

  validates :name, presence: true
end
