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
    CatRentalRequest.find_by_sql([<<-SQL, self.cat_id, self.id, self.start_date, self.end_date, self.start_date, self.end_date, self.start_date, self.end_date])
    SELECT
    *
    FROM
    cat_rental_requests
    WHERE
    cat_id = ? AND
    id <> ? AND 
    ((start_date between ? AND ?) OR (end_date between ? AND ?) OR (start_date < ? AND end_date > ?))
    SQL
  end
  
  def overlapping_approved_requests
    overlapping_requests.select { |request| request.status == "APPROVED" }
  end
  
  def overlapping_pending_requests
    overlapping_requests.select { |request| request.status == "PENDING" }
  end
  
  def approve!
    transaction do
      self.status = "APPROVED"
      self.save!
    
      self.overlapping_pending_requests.each do |request|
        request.deny!
      end
    end
  end
  
  def deny!
    self.status = "DENIED"
    self.save!
  end
  
  
end