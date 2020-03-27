class LocationImage < ApplicationRecord
  belongs_to       :location
  has_one_attached :image

  validate :attached_image
  
  def attached_image
    unless image.attached?
      image.purge
      errors[:image] << 'Image Not Attached'
    end
  end

  def sized_image(size: 300)
    image.variant(resize: "!#{size}x#{size}").processed if image.attached?
  end
end
