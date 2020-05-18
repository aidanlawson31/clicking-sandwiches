class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         authentication_keys: [:email]

  belongs_to :business, optional: true

  attribute :admin, :boolean, default: true
end
