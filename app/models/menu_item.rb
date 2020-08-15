class MenuItem < ApplicationRecord
  belongs_to :category
  has_many   :menu_item_options, dependent: :destroy
  has_many   :menu_item_tags,    dependent: :destroy
  has_many   :tags,              through: :menu_item_tags
 
  has_one_attached :image
  
  accepts_nested_attributes_for :menu_item_options, allow_destroy: :true

  default_scope { order(:display_sequence_number) }

  attribute :item_options, :boolean, default: false
  attribute :item_tags,    :boolean, default: false

  before_validation :sanitize_text

  validates :name,                    presence: true
  validates :price,                   presence: true
  validates :display_sequence_number, inclusion: 0..10_000
  validates :item_options,            inclusion: { in: [true, false] }
  validates :item_tags,               inclusion: { in: [true, false] }

  after_save :remove_tags, unless: :item_tags

  def remove_tags
    self.menu_item_tags.destroy_all
  end
  
  def sized_image(size: 140)
    image.variant(resize: "#{size}x#{size}").processed if image.attached?
  end

  private

  def sanitize_text
    self.description = Utility.sanitize_rich_text(description)
  end
end
