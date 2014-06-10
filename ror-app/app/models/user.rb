class User < ActiveRecord::Base
  #has_and_belongs_to_many :dvds
  has_many :rentals
  has_many :dvds, through: :rentals
end
