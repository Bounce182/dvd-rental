class Rental < ActiveRecord::Base
  belongs_to :user
  belongs_to :dvd

  scope :debtor, -> { where("return_date < ? AND returned = ?", Date.today, false) }

  validates :user_id, presence: true
  validates :total_price, presence: true
  validates :rent_date, :presence => {:message => "must be a valid date" }
  validates :return_date, :presence => {:message => "must be a valid date"}
  validate :rent_must_be_before_return

  private
  def rent_must_be_before_return
    errors.add(:rent_date, "must be before return date") unless rent_date < return_date
  end
end
