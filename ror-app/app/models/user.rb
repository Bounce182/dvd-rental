class User < ActiveRecord::Base
  has_many :rentals, dependent: :destroy
  has_many :dvds, through: :rentals

  validates :name, presence: true
  validates :surname, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :phone, presence: true
  validates :address, presence: true
end
