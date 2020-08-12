class Tag < ApplicationRecord
  belongs_to :business, optional: true
  has_many   :menu_item_tags, dependent: :destroy

  validates :name, presence: true

  has_one_attached :icon

  def sized_icon(size: 140)
    icon.variant(resize: "#{size}x#{size}").processed if icon.attached?
  end
end
