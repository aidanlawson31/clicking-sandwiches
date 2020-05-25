class LocationImage < ApplicationRecord
  belongs_to       :location
  has_one_attached :image

  default_scope { order(:display_sequence_number) }

  def sized_image(size: 300)
    image.variant(resize: "!#{size}x#{size}").processed if image.attached?
  end
end
