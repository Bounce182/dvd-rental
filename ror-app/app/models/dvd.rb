class Dvd < ActiveRecord::Base
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :languages
  has_many :rentals, dependent: :destroy
  has_many :users, through: :rentals

  validates :title, presence: true
  validates :year, inclusion: {in: 1900..Time.now.year.to_i}, :presence => {:message => 'Year must be from 1900 till current year.'}
  validates :length, inclusion: {in: 1..999}, :presence => {:message => 'DVD length must be in minutes in range 1..999.'}
  validates :genre_ids, presence: true
  validates :language_ids, presence: true
end
