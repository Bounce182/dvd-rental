class Dvd < ActiveRecord::Base
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :languages
  has_many :rentals
  has_many :users, through: :rentals
end
