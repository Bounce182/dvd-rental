class User < ActiveRecord::Base
  has_many :rentals
  has_many :dvds, through: :rentals
end
