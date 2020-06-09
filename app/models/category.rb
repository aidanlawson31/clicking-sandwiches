class Category < ApplicationRecord
  belongs_to :menu
  has_many   :menu_items, dependent: :destroy

  accepts_nested_attributes_for :menu_items, allow_destroy: true

  default_scope { order(:display_sequence_number) }

  validates :name, presence: true
	validates :display_sequence_number, inclusion: 0..10_000
end
