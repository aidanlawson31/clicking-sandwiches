class MenuItem < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  default_scope { order(:display_sequence_number) }

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true
	validates :display_sequence_number, inclusion: 1..10_000

  def sized_image(size: 140)
    image.variant(resize: "#{size}x#{size}").processed if image.attached?
  end
end
