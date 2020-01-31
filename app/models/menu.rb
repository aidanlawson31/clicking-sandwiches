class Menu < ApplicationRecord
  has_many :categories, dependent: :delete_all
  validates :name, presence: true
end
