class Cat < ActiveRecord::Base
  COLORS = %w[red orange yellow green blue black]
  
  attr_accessible :age, :birth_date, :color, :name, :sex, :user_id
  validates :age, :birth_date, :color, :name, :sex, :user_id, presence: true
  validates :age, :user_id, numericality: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w[M F] }
  
  has_many(
  :rental_requests,
  :class_name => "CatRentalRequest",
  :foreign_key => :cat_id,
  :primary_key => :id,
  :order => "start_date ASC",
  :dependent => :destroy
  )
  
  belongs_to(
  :owner,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )
  
  def has_pending_requests?
    self.rental_requests.any? { |request| request.status == "PENDING" }
  end

end
