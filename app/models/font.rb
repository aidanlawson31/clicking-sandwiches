class Font < ApplicationRecord
  has_many :business_display_attributes

  validates :name, presence: true

  def self.default
    @default ||= Font.find_by(name: "Arial")
  end
end
