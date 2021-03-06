class Location < ApplicationRecord
  belongs_to :business
  has_many   :location_menus,  dependent: :destroy
  has_many   :location_images, dependent: :destroy

  accepts_nested_attributes_for :location_images
  
  before_validation :convert_location_url

  validates :name,         presence: true, uniqueness: { scope: :business }
  validates :address,      presence: true
  validates :location_url, presence: true

  geocoded_by      :address
  after_validation :geocode, if: :address_changed?

  def convert_location_url
    return unless self.name
    self.location_url = self.name.downcase.parameterize
  end
end
