class Language < ActiveRecord::Base
  has_and_belongs_to_many :dvds
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end

