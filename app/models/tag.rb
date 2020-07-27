class Tag < ApplicationRecord
  belongs_to :business, optional: true
  has_many   :menu_item_tags, dependent: :destroy

  validates :name, presence: true
  validates :display_sequence_number, inclusion: 0..10_000

  has_one_attached :icon
end
