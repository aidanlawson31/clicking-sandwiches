class MenuItem < ApplicationRecord
  belongs_to :category
  has_many   :menu_item_options, dependent: :destroy

  has_one_attached :image
  
  accepts_nested_attributes_for :menu_item_options, allow_destroy: :true

  default_scope { order(:display_sequence_number) }

  attribute :item_options, :boolean, default: false

  before_validation :sanitize_text
  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true
	validates :display_sequence_number, inclusion: 0..10_000
  validates :item_options, inclusion: { in: [true, false] }

  def sized_image(size: 140)
    image.variant(resize: "#{size}x#{size}").processed if image.attached?
  end

  private

  def sanitize_text
    sanitized_description = sanitize(description)
    self.description = sanitized_description.gsub("\n", '') if sanitized_description
	end
end
