class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :status, :start_date, :end_date
  validates :cat_id, :status, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w[PENDING APPROVED DENIED] }
  before_validation(on: :create) do
    self.status ||= "PENDING"
  end
  
  belongs_to(
  :cat,
  :class_name => "Cat",
  :foreign_key => :cat_id,
  :primary_key => :id
  )


  def overlapping_requests
    CatRentalRequest.find_by_sql([<<-SQL, self.cat_id, self.id, self.start_date, self.end_date, self.start_date, self.end_date])
    SELECT
    *
    FROM
    cat_rental_requests
    WHERE
    cat_id = ? AND
    id <> ? AND 
    ((start_date between ? and ?) OR (end_date between ? and ?))
    SQL
  end
  
  def overlapping_approved_requests
    overlapping_requests.select { |request| request.status == "APPROVED" }
  end
end