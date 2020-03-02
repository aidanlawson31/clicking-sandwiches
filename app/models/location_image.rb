class LocationImage < ApplicationRecord
  belongs_to :location
  has_one_attached :image

  def sized_image
    self.image.variant(resize: '!300x300').processed
  end
end
