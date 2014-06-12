class Rental < ActiveRecord::Base
  belongs_to :user
  belongs_to :dvd
  validates :user_id, presence: true
  validates :total_price, presence: true
end
