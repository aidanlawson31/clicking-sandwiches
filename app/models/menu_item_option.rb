class MenuItemOption < ApplicationRecord
  belongs_to :menu_item

  default_scope { order(:display_sequence_number) }

  validates :name,  presence: true
  validates :display_sequence_number, inclusion: 0..10_000
end
