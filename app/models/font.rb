class Font < ApplicationRecord
  has_many :business_display_attributes, dependent: :restrict_with_error
  has_many :heading_font, class_name: "BusinessDisplayAttribute", dependent: :restrict_with_error

  validates :name, presence: true

  def self.default
    @default ||= Font.find_by(name: "Arial")
  end
end
