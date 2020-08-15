class Tag < ApplicationRecord
  belongs_to :business, optional: true
  has_many   :menu_item_tags, dependent: :destroy

  default_scope { order(:display_sequence_number) }

  validates :name, presence: true
  validates :display_sequence_number, inclusion: 0..10_000

  has_one_attached :icon

  def sized_icon(size: 140)
    icon.variant(resize: "#{size}x#{size}").processed if icon.attached?
  end
end
