class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :status, :start_date, :end_date
  validates :cat_id, :status, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w[PENDING APPROVED DENIED] }
end