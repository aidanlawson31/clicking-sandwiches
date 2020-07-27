class Font < ApplicationRecord
  has_many :business_display_attributes
  has_many :heading_font, class_name: "BusinessDisplayAttribute"

  validates :name, presence: true

  def self.default
    @default ||= Font.find_by(name: "Arial")
  end
end
