class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :status, :start_date, :end_date
  validates :cat_id, :status, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w[PENDING APPROVED DENIED] }
  
  belongs_to(
  :cat,
  :class_name => "Cat",
  :foreign_key => :cat_id,
  :primary_key => :id
  )


  def overlapping_requests
    CatRentalRequest.where("cat_id = ? AND id <> ?", self.cat_id, self.id)
  end
  
  def overlapping_approved_requests
    overlapping_requests.select { |request| request.status == "APPROVED" }
  end
end