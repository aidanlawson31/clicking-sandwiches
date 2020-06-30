class Reservation < ApplicationRecord
  belongs_to :location

  validates :name,             presence: true
  validates :time,             presence: true
  validates :number_of_people, presence: true
  validates :phone_number,     presence: true
  validates :status,           presence: true
end
